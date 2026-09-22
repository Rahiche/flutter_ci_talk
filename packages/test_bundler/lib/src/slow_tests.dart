import 'dart:io';

import 'package:path/path.dart' as p;

/// Where a finding lives. The distinction is the whole point of the tool.
enum Origin {
  /// Production code a test awaits. One delay here is paid by every test
  /// that reaches it, which is why these are listed first and counted
  /// separately - and why grepping only test/ finds nothing.
  lib,

  /// The test file itself.
  test,
}

enum Severity { high, medium, low }

class Finding {
  Finding({
    required this.file,
    required this.line,
    required this.origin,
    required this.category,
    required this.severity,
    required this.costMs,
    required this.problem,
    required this.fix,
    this.snippet = '',
  });

  final String file;
  final int line;
  final Origin origin;
  final String category;
  final Severity severity;

  /// Wall-clock milliseconds this costs per run, as best we can tell from
  /// source alone. An estimate, and labelled as one in the output.
  final int costMs;
  final String problem;
  final String fix;
  final String snippet;
}

final _delaySeconds = RegExp(
  r'Future\.delayed\([^)]*Duration\(seconds:\s*(\d+)',
);
final _delayMillis = RegExp(
  r'Future\.delayed\([^)]*Duration\(milliseconds:\s*(\d+)',
);
final _sleep = RegExp(r'\bsleep\(\s*(?:const\s+)?Duration\(');
final _pumpLoop = RegExp(r'for\s*\([^)]*<\s*(\d+)');
final _testCall = RegExp(r'\b(?:test|testWidgets)\(');

/// Scans [root] for patterns that make a Flutter suite slow.
///
/// Walks production sources as well as tests. Scanning only `test/` is the
/// mistake that cost me an afternoon: the suite was slow because of a
/// hundred-millisecond debounce in a cubit, and there was nothing to find
/// in the test file that awaited it.
List<Finding> scan(Directory root) {
  final findings = <Finding>[];

  for (final file
      in root
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.dart'))
          .where((f) => !_isIgnored(f.path))
          .toList()
        ..sort((a, b) => a.path.compareTo(b.path))) {
    final rel = p.relative(file.path, from: root.path);
    final isTest =
        rel.endsWith('_test.dart') ||
        p.split(rel).contains('test') ||
        p.split(rel).contains('integration_test');
    final origin = isTest ? Origin.test : Origin.lib;

    final content = file.readAsStringSync();
    final lines = content.split('\n');

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      Finding at(
        String category,
        Severity sev,
        int cost,
        String problem,
        String fix,
      ) => Finding(
        file: rel,
        line: i + 1,
        origin: origin,
        category: category,
        severity: sev,
        costMs: cost,
        problem: problem,
        fix: fix,
        snippet: line.trim(),
      );

      final secs = _delaySeconds.firstMatch(line);
      if (secs != null) {
        final s = int.parse(secs.group(1)!);
        findings.add(
          at(
            origin == Origin.lib ? 'AWAITED_DELAY' : 'ASYNC_DELAY',
            Severity.high,
            s * 1000,
            '${s}s real delay',
            origin == Origin.lib
                ? 'Inject a Duration (default it in production, pass Duration.zero in tests), '
                      'or drive it with fake_async.'
                : 'Use fakeAsync + elapse(), or await the operation directly.',
          ),
        );
      }

      final ms = _delayMillis.firstMatch(line);
      if (ms != null) {
        final n = int.parse(ms.group(1)!);
        final inSetUp = isTest && _isInSetUp(lines, i);
        // In lib, anything a test can await is wall time. In a test file,
        // a short delay only matters when setUp repeats it per test.
        if (origin == Origin.lib && n >= 20) {
          findings.add(
            at(
              'AWAITED_DELAY',
              n >= 100 ? Severity.high : Severity.medium,
              n,
              '${n}ms delay in production code - every test through this path waits',
              'Inject the Duration and pass Duration.zero in tests.',
            ),
          );
        } else if (inSetUp && n >= 50) {
          findings.add(
            at(
              'HEAVY_SETUP',
              n >= 200 ? Severity.high : Severity.medium,
              n * _testsInFile(content),
              '${n}ms in setUp - runs before every test in the group',
              'Move to setUpAll(), or remove the delay.',
            ),
          );
        } else if (n >= 100) {
          findings.add(
            at(
              'ASYNC_DELAY',
              Severity.medium,
              n,
              '${n}ms real delay',
              'Use fakeAsync + elapse().',
            ),
          );
        }
      }

      if (_sleep.hasMatch(line)) {
        findings.add(
          at(
            'BLOCKING_SLEEP',
            Severity.high,
            500,
            'sleep() blocks the isolate outright',
            'Never sleep in a test path.',
          ),
        );
      }

      if (line.contains('Directory.systemTemp') ||
          (line.contains('File(') && line.contains('.write'))) {
        findings.add(
          at(
            'REAL_IO',
            Severity.medium,
            50,
            'Real filesystem I/O',
            'Use MemoryFileSystem from package:file.',
          ),
        );
      }

      final loop = _pumpLoop.firstMatch(line);
      if (loop != null &&
          i + 1 < lines.length &&
          lines[i + 1].contains('pump(')) {
        final count = int.parse(loop.group(1)!);
        if (count > 20) {
          findings.add(
            at(
              'EXCESSIVE_PUMP',
              count > 50 ? Severity.medium : Severity.low,
              count * 2,
              'Pumping $count times in a loop',
              'Use pumpAndSettle(), or pump a specific number of frames.',
            ),
          );
        }
      }
    }

    if (isTest) {
      final count = _testsInFile(content);
      if (count > 20) {
        findings.add(
          Finding(
            file: rel,
            line: 0,
            origin: origin,
            category: 'MEGA_FILE',
            severity: count > 30 ? Severity.high : Severity.medium,
            // One isolate per FILE, so a big file is cheap per test; it is the
            // long pole that hurts when the suite is sharded.
            costMs: 0,
            problem: '$count tests in one file',
            fix:
                'Split it. Sharding divides by file, so this file is one shard '
                'that nothing else can help with.',
          ),
        );
      }
    }
  }

  findings.sort((a, b) {
    if (a.origin != b.origin) return a.origin == Origin.lib ? -1 : 1;
    return b.costMs.compareTo(a.costMs);
  });
  return findings;
}

bool _isIgnored(String path) {
  final parts = p.split(path);
  return parts.contains('.dart_tool') ||
      parts.contains('build') ||
      path.endsWith('.g.dart') ||
      path.endsWith('.freezed.dart') ||
      path.endsWith('.mocks.dart');
}

int _testsInFile(String content) => _testCall.allMatches(content).length;

/// Whether line [i] sits inside a `setUp(` block, by brace depth.
bool _isInSetUp(List<String> lines, int i) {
  var depth = 0;
  for (var j = i; j >= 0; j--) {
    for (final c in lines[j].split('').reversed) {
      if (c == '}') depth++;
      if (c == '{') {
        if (depth == 0) {
          if (lines[j].contains('setUp(')) return true;
          if (lines[j].contains('setUpAll(')) return false;
        } else {
          depth--;
        }
      }
    }
  }
  return false;
}

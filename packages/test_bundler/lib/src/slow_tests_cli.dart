import 'dart:io';

import 'package:args/args.dart';
import 'slow_tests.dart';

/// Runs the scanner CLI. Kept in lib/ so a repo's own tool/ script can
/// call it without the executable being on PATH.
void run(List<String> args) {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false)
    ..addFlag(
      'tests-only',
      negatable: false,
      help: 'Skip production code. Usually the wrong answer - see README.',
    )
    ..addOption(
      'min-cost',
      defaultsTo: '0',
      help: 'Hide findings estimated below this many ms.',
    );

  final opts = parser.parse(args);
  if (opts['help'] as bool) {
    stdout.writeln('Usage: find-slow-tests [directory]\n\n${parser.usage}');
    return;
  }

  final dir = Directory(opts.rest.isNotEmpty ? opts.rest.first : '.');
  if (!dir.existsSync()) {
    stderr.writeln('No such directory: ${dir.path}');
    exit(2);
  }

  final minCost = int.parse(opts['min-cost'] as String);
  var findings = scan(dir).where((f) => f.costMs >= minCost).toList();
  if (opts['tests-only'] as bool) {
    findings = findings.where((f) => f.origin == Origin.test).toList();
  }

  if (findings.isEmpty) {
    stdout.writeln('Nothing found in ${dir.path}.');
    return;
  }

  final inLib = findings.where((f) => f.origin == Origin.lib).toList();
  final libMs = inLib.fold<int>(0, (a, f) => a + f.costMs);
  final allMs = findings.fold<int>(0, (a, f) => a + f.costMs);

  stdout.writeln('${findings.length} findings in ${dir.path}\n');
  if (inLib.isNotEmpty) {
    stdout.writeln('  ${inLib.length} are in production code, not in tests.');
    stdout.writeln(
      '  Those are the ones that cost you: every test that '
      'reaches them waits.\n',
    );
  }

  final byCategory = <String, List<Finding>>{};
  for (final f in findings) {
    byCategory.putIfAbsent(f.category, () => []).add(f);
  }
  for (final e in byCategory.entries) {
    final ms = e.value.fold<int>(0, (a, f) => a + f.costMs);
    stdout.writeln(
      '  ${e.key.padRight(16)} ${e.value.length.toString().padLeft(4)}'
      '   ~${(ms / 1000).toStringAsFixed(1)}s',
    );
  }
  stdout.writeln(
    '\n  in lib:  ~${(libMs / 1000).toStringAsFixed(1)}s per full run',
  );
  stdout.writeln(
    '  total:   ~${(allMs / 1000).toStringAsFixed(1)}s   '
    '(estimated from source; measure before you believe it)\n',
  );

  for (final f in findings.take(40)) {
    final sev = switch (f.severity) {
      Severity.high => 'HIGH  ',
      Severity.medium => 'MEDIUM',
      Severity.low => 'LOW   ',
    };
    final where = f.origin == Origin.lib ? 'lib ' : 'test';
    stdout.writeln('$sev $where ${f.file}${f.line > 0 ? ':${f.line}' : ''}');
    stdout.writeln('       ${f.problem}');
    stdout.writeln('       fix: ${f.fix}');
    if (f.snippet.isNotEmpty) stdout.writeln('       ${f.snippet}');
    stdout.writeln('');
  }
  if (findings.length > 40) {
    stdout.writeln('... ${findings.length - 40} more');
  }
}

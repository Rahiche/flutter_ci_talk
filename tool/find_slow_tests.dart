#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

/// Scans test files for common patterns that make tests slow.
///
/// Usage:
///   dart run tool/find_slow_tests.dart [directory]
///
/// This tool identifies:
///   1. Real async delays (Future.delayed with seconds)
///   2. Heavy setUp with delays
///   3. Real I/O (Directory.systemTemp, File operations)
///   4. Excessive widget pumping (pump loops > 20 iterations)
///   5. Mega test files (single files with > 20 tests)
///   6. Missing fakeAsync usage where delays exist
///
/// Output: a report sorted by estimated impact, with fix suggestions.
void main(List<String> args) {
  final dir = args.isNotEmpty ? args.first : 'packages';
  final issues = <_Issue>[];

  final testFiles = Directory(dir)
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('_test.dart'))
      .toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  print('Scanning ${testFiles.length} test files...\n');

  for (final file in testFiles) {
    final content = file.readAsStringSync();
    final lines = content.split('\n');
    final relativePath =
        file.path.replaceFirst(RegExp(r'^.*/packages/'), 'packages/');

    // Pattern 1: Real async delays
    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      final match = RegExp(
              r'Future\.delayed\(.*Duration\(seconds:\s*(\d+)')
          .firstMatch(line);
      if (match != null) {
        final seconds = int.parse(match.group(1)!);
        issues.add(_Issue(
          file: relativePath,
          line: i + 1,
          category: 'ASYNC_DELAY',
          severity: _Severity.high,
          estimatedCostMs: seconds * 1000,
          description: 'Real async delay: ${seconds}s wait',
          fix: 'Use fakeAsync + elapse(), or await the operation directly',
          snippet: line.trim(),
        ));
      }

      final matchMs = RegExp(
              r'Future\.delayed\(.*Duration\(milliseconds:\s*(\d+)')
          .firstMatch(line);
      if (matchMs != null) {
        final ms = int.parse(matchMs.group(1)!);
        if (ms >= 200) {
          // Only flag if in setUp
          final inSetUp = _isInSetUp(lines, i);
          if (inSetUp) {
            issues.add(_Issue(
              file: relativePath,
              line: i + 1,
              category: 'HEAVY_SETUP',
              severity: ms >= 500 ? _Severity.high : _Severity.medium,
              estimatedCostMs: ms * _countTestsInGroup(lines, i),
              description:
                  'setUp delay: ${ms}ms (runs before EVERY test in group)',
              fix:
                  'Move to setUpAll() or remove delay. Cost multiplies by test count.',
              snippet: line.trim(),
            ));
          }
        }
      }
    }

    // Pattern 3: Real I/O
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].contains('Directory.systemTemp') ||
          (lines[i].contains("File(") && lines[i].contains('.write'))) {
        issues.add(_Issue(
          file: relativePath,
          line: i + 1,
          category: 'REAL_IO',
          severity: _Severity.medium,
          estimatedCostMs: 50,
          description: 'Real filesystem I/O in test',
          fix: 'Use in-memory alternatives (e.g., MemoryFileSystem from package:file)',
          snippet: lines[i].trim(),
        ));
      }
    }

    // Pattern 4: Excessive pumping
    for (var i = 0; i < lines.length; i++) {
      final pumpMatch =
          RegExp(r'for\s*\(.*i\s*<\s*(\d+)').firstMatch(lines[i]);
      if (pumpMatch != null) {
        final count = int.parse(pumpMatch.group(1)!);
        if (count > 20 && i + 1 < lines.length && lines[i + 1].contains('pump(')) {
          issues.add(_Issue(
            file: relativePath,
            line: i + 1,
            category: 'EXCESSIVE_PUMP',
            severity: count > 50 ? _Severity.medium : _Severity.low,
            estimatedCostMs: count * 2,
            description: 'Pumping $count times in a loop',
            fix: 'Use pumpAndSettle() or pump a specific number of frames',
            snippet: '${lines[i].trim()} ${lines[i + 1].trim()}',
          ));
        }
      }
    }

    // Pattern 5: Mega test files
    final testCount = RegExp(r"\btest\(|testWidgets\(").allMatches(content).length;
    if (testCount > 20) {
      issues.add(_Issue(
        file: relativePath,
        line: 0,
        category: 'MEGA_FILE',
        severity: testCount > 30 ? _Severity.high : _Severity.medium,
        estimatedCostMs: testCount * 50, // isolate overhead estimate
        description: '$testCount tests in one file',
        fix:
            'Split into smaller files. Flutter parallelizes across files, not within them.',
        snippet: '',
      ));
    }

    // Pattern 6: Missing fakeAsync
    if (content.contains('Future.delayed') &&
        !content.contains('fakeAsync') &&
        content.contains('Duration(seconds:')) {
      issues.add(_Issue(
        file: relativePath,
        line: 0,
        category: 'MISSING_FAKE_ASYNC',
        severity: _Severity.low,
        estimatedCostMs: 0,
        description: 'File uses real delays but never imports/uses fakeAsync',
        fix: "import 'package:fake_async/fake_async.dart' and wrap delay-dependent tests",
        snippet: '',
      ));
    }
  }

  // Sort by estimated cost (highest first)
  issues.sort((a, b) => b.estimatedCostMs.compareTo(a.estimatedCostMs));

  // Print report
  if (issues.isEmpty) {
    print('No slow test patterns found!');
    return;
  }

  print('Found ${issues.length} potential issues:\n');
  print('${'=' * 80}');

  // Summary by category
  final byCategory = <String, List<_Issue>>{};
  for (final issue in issues) {
    byCategory.putIfAbsent(issue.category, () => []).add(issue);
  }

  print('\nSummary by category:');
  for (final entry in byCategory.entries) {
    final totalMs =
        entry.value.fold<int>(0, (sum, i) => sum + i.estimatedCostMs);
    final totalSec = (totalMs / 1000).toStringAsFixed(1);
    print(
        '  ${entry.key}: ${entry.value.length} issues (~${totalSec}s estimated waste)');
  }

  final totalWasteMs = issues.fold<int>(0, (sum, i) => sum + i.estimatedCostMs);
  print('\nTotal estimated waste: ${(totalWasteMs / 1000).toStringAsFixed(1)}s');
  print('${'=' * 80}\n');

  // Detailed report
  for (final issue in issues) {
    final severity = switch (issue.severity) {
      _Severity.high => '🔴 HIGH',
      _Severity.medium => '🟡 MEDIUM',
      _Severity.low => '🟢 LOW',
    };

    print('$severity  ${issue.category}');
    print('  File: ${issue.file}${issue.line > 0 ? ':${issue.line}' : ''}');
    print('  Problem: ${issue.description}');
    print('  Fix: ${issue.fix}');
    if (issue.snippet.isNotEmpty) {
      print('  Code: ${issue.snippet}');
    }
    if (issue.estimatedCostMs > 0) {
      print('  Est. cost: ${issue.estimatedCostMs}ms');
    }
    print('');
  }
}

bool _isInSetUp(List<String> lines, int lineIndex) {
  for (var i = lineIndex; i >= 0 && i > lineIndex - 10; i--) {
    if (lines[i].contains('setUp(') || lines[i].contains('setUp(() async')) {
      return true;
    }
    if (lines[i].contains('test(') || lines[i].contains('testWidgets(')) {
      return false;
    }
  }
  return false;
}

int _countTestsInGroup(List<String> lines, int lineIndex) {
  // Count tests in the surrounding group
  var count = 0;
  var depth = 0;
  var foundGroup = false;

  for (var i = lineIndex; i >= 0; i--) {
    if (lines[i].contains("group(")) {
      foundGroup = true;
      break;
    }
  }

  if (!foundGroup) return 1;

  for (var i = lineIndex; i < lines.length; i++) {
    if (lines[i].contains('test(') || lines[i].contains('testWidgets(')) {
      count++;
    }
    if (lines[i].contains('});') && depth == 0 && i > lineIndex + 2) break;
    depth += lines[i].split('{').length - 1;
    depth -= lines[i].split('}').length - 1;
    if (depth < 0) break;
  }

  return count.clamp(1, 50);
}

enum _Severity { high, medium, low }

class _Issue {
  final String file;
  final int line;
  final String category;
  final _Severity severity;
  final int estimatedCostMs;
  final String description;
  final String fix;
  final String snippet;

  const _Issue({
    required this.file,
    required this.line,
    required this.category,
    required this.severity,
    required this.estimatedCostMs,
    required this.description,
    required this.fix,
    required this.snippet,
  });
}

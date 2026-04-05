#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

/// Generates single-isolate test wrappers for each package.
/// This reduces cold start overhead by running all tests in one isolate.
///
/// Usage:
///   dart run tool/generate_test_wrapper.dart [--shards=N]
void main(List<String> args) {
  final shards = _parseShards(args);
  final root = Directory.current.path;
  final packagesDir = Directory('$root/packages');

  for (final pkg in packagesDir.listSync().whereType<Directory>()) {
    final testDir = Directory('${pkg.path}/test');
    if (!testDir.existsSync()) continue;

    final pkgName = pkg.path.split('/').last;
    final testFiles = _findTestFiles(testDir)
      ..sort((a, b) => a.path.compareTo(b.path));

    if (testFiles.isEmpty) continue;

    if (shards > 1) {
      _generateShardedWrappers(pkg.path, pkgName, testFiles, shards);
    } else {
      _generateSingleWrapper(pkg.path, pkgName, testFiles);
    }
  }

  print('Test wrappers generated successfully.');
}

int _parseShards(List<String> args) {
  for (final arg in args) {
    if (arg.startsWith('--shards=')) {
      return int.parse(arg.split('=')[1]);
    }
  }
  return 1;
}

List<File> _findTestFiles(Directory testDir) {
  return testDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) =>
          f.path.endsWith('_test.dart') &&
          !f.path.endsWith('all_tests.dart') &&
          !f.path.contains('all_tests_shard'))
      .toList();
}

void _generateSingleWrapper(
    String pkgPath, String pkgName, List<File> testFiles) {
  final buf = StringBuffer();
  buf.writeln('// GENERATED — do not edit by hand.');
  buf.writeln('// Single-isolate test wrapper for $pkgName');
  buf.writeln("// Run: flutter test test/all_tests.dart");
  buf.writeln();
  buf.writeln("import 'package:flutter/services.dart';");
  buf.writeln("import 'package:flutter_test/flutter_test.dart';");
  buf.writeln();

  // Imports
  for (var i = 0; i < testFiles.length; i++) {
    final relative =
        testFiles[i].path.replaceFirst('$pkgPath/test/', '');
    buf.writeln("import '$relative' as test_$i;");
  }

  buf.writeln();
  buf.writeln('void main() {');

  // Reset environment between groups
  buf.writeln('  void resetTestEnvironment() {');
  buf.writeln('    TestWidgetsFlutterBinding.ensureInitialized();');
  buf.writeln('    // Reset screen size');
  buf.writeln(
      '    final binding = TestWidgetsFlutterBinding.instance;');
  buf.writeln(
      '    binding.platformDispatcher.clearAllTestValues();');
  buf.writeln('  }');
  buf.writeln();

  for (var i = 0; i < testFiles.length; i++) {
    final relative =
        testFiles[i].path.replaceFirst('$pkgPath/test/', '');
    buf.writeln("  group('$relative', () {");
    buf.writeln('    setUp(() => resetTestEnvironment());');
    buf.writeln('    test_$i.main();');
    buf.writeln('  });');
    buf.writeln();
  }

  buf.writeln('}');

  File('$pkgPath/test/all_tests.dart').writeAsStringSync(buf.toString());
  print('  Generated $pkgName/test/all_tests.dart (${testFiles.length} files)');
}

void _generateShardedWrappers(
    String pkgPath, String pkgName, List<File> testFiles, int shards) {
  final perShard = (testFiles.length / shards).ceil();

  for (var shard = 0; shard < shards; shard++) {
    final start = shard * perShard;
    final end =
        (start + perShard).clamp(0, testFiles.length);
    if (start >= testFiles.length) break;

    final shardFiles = testFiles.sublist(start, end);
    final buf = StringBuffer();
    buf.writeln('// GENERATED — do not edit by hand.');
    buf.writeln(
        '// Single-isolate test wrapper for $pkgName (shard ${shard + 1}/$shards)');
    buf.writeln();
    buf.writeln("import 'package:flutter/services.dart';");
    buf.writeln("import 'package:flutter_test/flutter_test.dart';");
    buf.writeln();

    for (var i = 0; i < shardFiles.length; i++) {
      final relative =
          shardFiles[i].path.replaceFirst('$pkgPath/test/', '');
      buf.writeln("import '$relative' as test_$i;");
    }

    buf.writeln();
    buf.writeln('void main() {');
    buf.writeln('  void resetTestEnvironment() {');
    buf.writeln('    TestWidgetsFlutterBinding.ensureInitialized();');
    buf.writeln(
        '    final binding = TestWidgetsFlutterBinding.instance;');
    buf.writeln(
        '    binding.platformDispatcher.clearAllTestValues();');
    buf.writeln('  }');
    buf.writeln();

    for (var i = 0; i < shardFiles.length; i++) {
      final relative =
          shardFiles[i].path.replaceFirst('$pkgPath/test/', '');
      buf.writeln("  group('$relative', () {");
      buf.writeln('    setUp(() => resetTestEnvironment());');
      buf.writeln('    test_$i.main();');
      buf.writeln('  });');
      buf.writeln();
    }

    buf.writeln('}');

    File('$pkgPath/test/all_tests_shard_${shard + 1}.dart')
        .writeAsStringSync(buf.toString());
    print(
        '  Generated $pkgName/test/all_tests_shard_${shard + 1}.dart (${shardFiles.length} files)');
  }
}

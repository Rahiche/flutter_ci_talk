import 'dart:io';

import 'package:path/path.dart' as p;

class BundleConfig {
  const BundleConfig({
    required this.rootPath,
    this.packagesDir = 'packages',
    this.outputName = 'all_tests.dart',
    this.shards = 1,
    this.dryRun = false,
    this.verbose = false,
    this.resetHook,
  });

  final String rootPath;
  final String packagesDir;
  final String outputName;
  final int shards;
  final bool dryRun;
  final bool verbose;

  /// `<import uri>#<function>` called before every test, inside each group.
  ///
  /// Bundling puts every test file in one isolate, so anything global -
  /// a GetIt container, SharedPreferences mock values, a static cache -
  /// now survives from one file into the next. This is the hook that wipes
  /// it; without one, bundling trades wall time for order-dependent tests.
  final String? resetHook;
}

class PackageBundleResult {
  const PackageBundleResult({
    required this.packageName,
    required this.generatedFiles,
    required this.testFileCount,
  });

  final String packageName;
  final List<String> generatedFiles;
  final int testFileCount;
}

class BundleResult {
  const BundleResult({required this.packageResults});

  final List<PackageBundleResult> packageResults;

  int get packageCount => packageResults.length;
  int get totalTestFiles =>
      packageResults.fold(0, (sum, p) => sum + p.testFileCount);
}

BundleResult generateTestBundles(BundleConfig config) {
  if (config.shards < 1) {
    throw ArgumentError.value(config.shards, 'shards', 'Must be >= 1');
  }

  final root = p.normalize(config.rootPath);
  final packagesPath = p.join(root, config.packagesDir);
  final packagesDir = Directory(packagesPath);

  if (!packagesDir.existsSync()) {
    throw FileSystemException('Packages directory not found', packagesPath);
  }

  final packageResults = <PackageBundleResult>[];
  final packageDirs = packagesDir.listSync().whereType<Directory>().toList()
    ..sort((a, b) => a.path.compareTo(b.path));

  for (final pkg in packageDirs) {
    final packageName = p.basename(pkg.path);
    final testDir = Directory(p.join(pkg.path, 'test'));
    if (!testDir.existsSync()) {
      continue;
    }

    final tests = _findTestFiles(testDir, outputName: config.outputName);

    if (tests.isEmpty) {
      continue;
    }

    final generated = config.shards == 1
        ? <String>[
            _generateSingleBundle(
              packagePath: pkg.path,
              packageName: packageName,
              testFiles: tests,
              outputName: config.outputName,
              dryRun: config.dryRun,
              verbose: config.verbose,
              resetHook: config.resetHook,
            ),
          ]
        : _generateShardedBundles(
            packagePath: pkg.path,
            packageName: packageName,
            testFiles: tests,
            shards: config.shards,
            outputName: config.outputName,
            dryRun: config.dryRun,
            verbose: config.verbose,
            resetHook: config.resetHook,
          );

    packageResults.add(
      PackageBundleResult(
        packageName: packageName,
        generatedFiles: generated,
        testFileCount: tests.length,
      ),
    );
  }

  return BundleResult(packageResults: packageResults);
}

List<File> _findTestFiles(Directory testDir, {required String outputName}) {
  return testDir.listSync(recursive: true).whereType<File>().where((file) {
    final fileName = p.basename(file.path);
    if (!fileName.endsWith('_test.dart')) {
      return false;
    }
    if (fileName == outputName) {
      return false;
    }
    if (fileName.startsWith('all_tests_shard_')) {
      return false;
    }
    return true;
  }).toList()..sort((a, b) => a.path.compareTo(b.path));
}

String _generateSingleBundle({
  required String packagePath,
  required String packageName,
  required List<File> testFiles,
  required String outputName,
  required bool dryRun,
  required bool verbose,
  required String? resetHook,
}) {
  final outputPath = p.join(packagePath, 'test', outputName);
  final content = _renderBundleContent(
    packagePath: packagePath,
    packageName: packageName,
    testFiles: testFiles,
    shardLabel: null,
    resetHook: resetHook,
  );

  if (!dryRun) {
    File(outputPath).writeAsStringSync(content);
  }

  if (verbose) {
    stdout.writeln('Generated $outputPath (${testFiles.length} tests)');
  }

  return outputPath;
}

List<String> _generateShardedBundles({
  required String packagePath,
  required String packageName,
  required List<File> testFiles,
  required int shards,
  required String outputName,
  required bool dryRun,
  required bool verbose,
  required String? resetHook,
}) {
  final perShard = (testFiles.length / shards).ceil();
  final outputs = <String>[];

  for (var shard = 0; shard < shards; shard++) {
    final start = shard * perShard;
    final end = (start + perShard).clamp(0, testFiles.length);
    if (start >= testFiles.length) {
      break;
    }

    final shardFiles = testFiles.sublist(start, end);
    final outputPath = p.join(
      packagePath,
      'test',
      '${p.basenameWithoutExtension(outputName)}_shard_${shard + 1}.dart',
    );

    final content = _renderBundleContent(
      packagePath: packagePath,
      packageName: packageName,
      testFiles: shardFiles,
      shardLabel: '${shard + 1}/$shards',
      resetHook: resetHook,
    );

    if (!dryRun) {
      File(outputPath).writeAsStringSync(content);
    }

    if (verbose) {
      stdout.writeln('Generated $outputPath (${shardFiles.length} tests)');
    }

    outputs.add(outputPath);
  }

  return outputs;
}

String _renderBundleContent({
  required String packagePath,
  required String packageName,
  required List<File> testFiles,
  required String? shardLabel,
  required String? resetHook,
}) {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED - do not edit by hand.');
  if (shardLabel == null) {
    buffer.writeln('// Single-isolate test wrapper for $packageName');
  } else {
    buffer.writeln(
      '// Single-isolate test wrapper for $packageName (shard $shardLabel)',
    );
  }
  buffer.writeln();
  buffer.writeln("import 'package:flutter/services.dart';");
  buffer.writeln("import 'package:flutter_test/flutter_test.dart';");
  final hook = _parseResetHook(resetHook);
  if (hook != null) {
    buffer.writeln("import '${hook.uri}' as _reset;");
  }
  buffer.writeln();

  for (var i = 0; i < testFiles.length; i++) {
    final relative = p.relative(
      testFiles[i].path,
      from: p.join(packagePath, 'test'),
    );
    final normalized = p.posix.normalize(relative.replaceAll('\\\\', '/'));
    buffer.writeln("import '$normalized' as test_$i;");
  }

  buffer.writeln();
  buffer.writeln('void main() {');
  buffer.writeln('  Future<void> resetTestEnvironment() async {');
  buffer.writeln('    TestWidgetsFlutterBinding.ensureInitialized();');
  buffer.writeln('    final binding = TestWidgetsFlutterBinding.instance;');
  buffer.writeln('    binding.platformDispatcher.clearAllTestValues();');
  if (hook != null) {
    // await works on a plain value too, so the hook may be sync or async.
    buffer.writeln('    await _reset.${hook.fn}();');
  }
  buffer.writeln('  }');
  buffer.writeln();

  for (var i = 0; i < testFiles.length; i++) {
    final relative = p.relative(
      testFiles[i].path,
      from: p.join(packagePath, 'test'),
    );
    final normalized = p.posix.normalize(relative.replaceAll('\\\\', '/'));
    buffer.writeln("  group('$normalized', () {");
    buffer.writeln('    setUp(() => resetTestEnvironment());');
    buffer.writeln('    test_$i.main();');
    buffer.writeln('  });');
    buffer.writeln();
  }

  buffer.writeln('}');
  return buffer.toString();
}


class _ResetHook {
  const _ResetHook(this.uri, this.fn);
  final String uri;
  final String fn;
}

/// Parses `package:app/test_support.dart#resetTestEnv`.
_ResetHook? _parseResetHook(String? spec) {
  if (spec == null || spec.isEmpty) return null;
  final i = spec.lastIndexOf('#');
  if (i <= 0 || i == spec.length - 1) {
    throw FormatException(
      'Expected --reset <import uri>#<function>, got: $spec',
    );
  }
  return _ResetHook(spec.substring(0, i), spec.substring(i + 1));
}

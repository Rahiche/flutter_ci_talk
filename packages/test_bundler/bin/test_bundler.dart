#!/usr/bin/env dart

import 'dart:io';

import 'package:args/args.dart';
import 'package:test_bundler/test_bundler.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      'root',
      help: 'Repository root path. Defaults to the current directory.',
      defaultsTo: Directory.current.path,
    )
    ..addOption(
      'packages-dir',
      help: 'Path to package folder from root.',
      defaultsTo: 'packages',
    )
    ..addOption(
      'output',
      help: 'Wrapper filename generated in each package test directory.',
      defaultsTo: 'all_tests.dart',
    )
    ..addOption(
      'shards',
      help: 'Generate sharded wrappers per package.',
      defaultsTo: '1',
    )
    ..addFlag(
      'dry-run',
      help: 'Print what would be generated without writing files.',
      negatable: false,
    )
    ..addFlag('verbose', help: 'Print generated files.', negatable: false)
    ..addFlag(
      'help',
      abbr: 'h',
      help: 'Print usage information.',
      negatable: false,
    );

  ArgResults parsed;
  try {
    parsed = parser.parse(args);
  } on FormatException catch (error) {
    stderr.writeln('Error: ${error.message}');
    stderr.writeln(parser.usage);
    exitCode = 64;
    return;
  }

  if (parsed['help'] as bool) {
    stdout.writeln('test-bundler: generate single-isolate test wrappers');
    stdout.writeln(parser.usage);
    return;
  }

  final shardsValue = parsed['shards'] as String;
  final shards = int.tryParse(shardsValue);
  if (shards == null || shards < 1) {
    stderr.writeln('Error: --shards must be a positive integer.');
    exitCode = 64;
    return;
  }

  final config = BundleConfig(
    rootPath: parsed['root'] as String,
    packagesDir: parsed['packages-dir'] as String,
    outputName: parsed['output'] as String,
    shards: shards,
    dryRun: parsed['dry-run'] as bool,
    verbose: parsed['verbose'] as bool,
  );

  try {
    final result = generateTestBundles(config);
    if (result.packageResults.isEmpty) {
      stdout.writeln('No test files found. Nothing to bundle.');
      return;
    }

    for (final package in result.packageResults) {
      stdout.writeln(
        'Bundled ${package.packageName}: ${package.testFileCount} test files -> ${package.generatedFiles.length} wrapper(s)',
      );
    }

    stdout.writeln(
      'Done. Bundled ${result.totalTestFiles} tests across ${result.packageCount} package(s).',
    );
  } on FileSystemException catch (error) {
    stderr.writeln('Filesystem error: ${error.message} (${error.path})');
    exitCode = 66;
  } catch (error) {
    stderr.writeln('Unexpected error: $error');
    exitCode = 1;
  }
}

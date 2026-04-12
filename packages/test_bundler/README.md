# test-bundler

Generate single-isolate Flutter test wrappers for each package in a monorepo.

This helps reduce test startup overhead in CI by running tests through a generated wrapper instead of one isolate per test file.

## Install

### Run directly from source

```bash
dart run bin/test_bundler.dart --help
```

### Install globally from GitHub

```bash
dart pub global activate --source git https://github.com/Rahiche/test-bundler.git
test-bundler --help
```

## Usage

From repository root:

```bash
test-bundler --root . --packages-dir packages
```

Generate sharded wrappers:

```bash
test-bundler --root . --packages-dir packages --shards 4
```

Dry-run without writing files:

```bash
test-bundler --dry-run --verbose
```

## What it generates

For each package containing a test directory:

- all_tests.dart when --shards=1
- all_tests_shard_1.dart, all_tests_shard_2.dart, etc when --shards > 1

Each wrapper imports all test files and executes them in grouped blocks while resetting test environment values between groups.

## Typical CI command

```bash
test-bundler --root . --packages-dir packages --shards 2
```

Then run each generated wrapper in parallel jobs, or run package tests in parallel with your existing CI scripts.

## License

MIT

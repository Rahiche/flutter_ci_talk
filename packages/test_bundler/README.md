# test_bundler

Two command-line tools for a Flutter monorepo whose test suite got slow.

- **`test-bundler`** generates a single-isolate test wrapper per package.
  `flutter test` spawns one isolate per test *file*, and each one boots the
  binding and loads the app before your first `expect`. With `--coverage` it
  is worse: coverage is collected per isolate over the VM service, so every
  file opens its own connection and returns a source report measured in
  megabytes. One bundled isolate means one boot and one report instead of
  hundreds. See [dart-lang/sdk#45985](https://github.com/dart-lang/sdk/issues/45985)
  and [flutter/flutter#192368](https://github.com/flutter/flutter/issues/192368).
- **`find-slow-tests`** scans a repo for the patterns that make a suite wait,
  and - unlike every version of this script I wrote first - it scans your
  **production code too**.

## Install

Not on pub.dev yet. Install from git - this is verified working:

```bash
dart pub global activate --source git https://github.com/Rahiche/flutter_ci_talk.git \
  --git-path packages/test_bundler

test-bundler --help
find-slow-tests --help
```

Or run it straight out of a clone, with no install at all:

```bash
dart run bin/test_bundler.dart --help
dart run bin/find_slow_tests.dart --help
```

## find-slow-tests

```
$ find-slow-tests packages

284 findings in packages

  258 are in production code, not in tests.
  Those are the ones that cost you: every test that reaches them waits.

  AWAITED_DELAY     254   ~24.5s
  REAL_IO            22   ~1.1s
  MEGA_FILE           8   ~0.0s
```

The first version of this only looked at `*_test.dart`, and it found nothing.
The suite was slow because of a debounce in a cubit three files away - a
`Future.delayed` that is completely correct in production and is pure wall
time in a test. That is the finding that matters, so it is listed first and
counted separately.

What it looks for:

| category | where | what |
|---|---|---|
| `AWAITED_DELAY` | lib | a `Future.delayed` a test can await - inject the `Duration` and pass `Duration.zero` |
| `ASYNC_DELAY` | test | a real delay in the test itself - use `fakeAsync` + `elapse()` |
| `HEAVY_SETUP` | test | a delay in `setUp`, so it repeats per test in the group |
| `BLOCKING_SLEEP` | both | `sleep()`, which blocks the isolate outright |
| `REAL_IO` | both | `Directory.systemTemp` and friends |
| `EXCESSIVE_PUMP` | test | `pump()` in a loop of more than 20 |
| `MEGA_FILE` | test | more than 20 tests in one file - sharding splits by file, so this file is one shard nothing can help with |

Flags: `--min-cost <ms>` hides small findings, `--tests-only` reverts to the
mistake above. The costs are estimated from source - measure before you
believe them.

Wire it into your own repo without installing it:

```dart
// tool/find_slow_tests.dart
import 'package:test_bundler/find_slow_tests.dart';

void main(List<String> args) => run(args);
```

## test-bundler usage

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

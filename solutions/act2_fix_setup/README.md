# Fix: Heavy setUp() with Async Delays

## Problem

The `integration_test.dart` files in each package use `setUp(() async { ... })`
blocks that contain `Future.delayed(const Duration(milliseconds: 500))`. This
delay runs before *every single test* in the group, adding 500ms of dead time
per test.

For example, in `analytics/test/integration_test.dart`, there are multiple
groups each with a setUp that delays 500ms, and each group has 5 tests. That
is 2.5 seconds of pure waiting per group, multiplied across all packages.

## What the fix does

The `fix.sh` script replaces the `Future.delayed` inside `setUp` blocks with
`Duration.zero`, so the setUp still yields but does not actually wait.

## Usage

```bash
# From the repo root:
./solutions/act2_fix_setup/fix.sh
```

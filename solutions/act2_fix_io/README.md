# Fix: Real File I/O in Unit Tests

## Problem

Several test files use `Directory.systemTemp.createTemp()` to create real
temporary directories and write/read files on disk. This is:

- Slow (disk I/O vs in-memory)
- Flaky (filesystem permissions, disk space, concurrent test runs)
- Not a unit test (it tests dart:io, not your code)

Affected files include:
- `*/test/everything_test.dart` (Cache Tests group)
- `*/test/repositories/*_repository_test.dart`

## What the fix does

The `fix.sh` script identifies all test files using `Directory.systemTemp` and
reports them. For the demo, it comments out the disk I/O test groups in the
`everything_test.dart` files, since those are the biggest offenders.

## Usage

```bash
# From the repo root:
./solutions/act2_fix_io/fix.sh
```

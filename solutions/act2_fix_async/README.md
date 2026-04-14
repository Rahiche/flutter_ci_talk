# Fix: Remove Artificial Async Delays in Tests

## Problem

Many test files use `Future.delayed(const Duration(seconds: 2))` to wait for
async operations. This is a common anti-pattern that makes the test suite
dramatically slower than it needs to be.

In this project, over 150 files contain `Future.delayed` calls, and the
`integration_test.dart` files are especially bad -- each one has dozens of
2-second delays.

## What the fix does

The `fix.sh` script finds all `_test.dart` files containing
`Future.delayed(const Duration(seconds: 2))` and replaces them with
`Future.delayed(Duration.zero)`, which yields to the event loop without
actually waiting.

This alone can cut test runtime from minutes to seconds.

## Usage

```bash
# From the repo root:
./solutions/act2_fix_async/fix.sh
```

# Fix: Mega Test Files

## Problem

Each package has two "mega" test files that cram dozens of tests into a single
file:

| File                    | Lines | Description                                 |
|-------------------------|-------|---------------------------------------------|
| `everything_test.dart`  | ~520  | Cubit tests, model tests, cache I/O, widget stress tests all in one file |
| `integration_test.dart` | ~250  | End-to-end lifecycle tests with heavy delays and setUp blocks |

Line counts across all 4 packages:

- `analytics/test/everything_test.dart`  -- 517 lines
- `app/test/everything_test.dart`        -- 517 lines
- `core/test/everything_test.dart`       -- 517 lines
- `payments/test/everything_test.dart`   -- 599 lines
- `analytics/test/integration_test.dart` -- 249 lines
- `app/test/integration_test.dart`       -- 249 lines
- `core/test/integration_test.dart`      -- 249 lines
- `payments/test/integration_test.dart`  -- 284 lines

**Total: ~3,181 lines of mega test files.**

## Why this is bad

1. **No parallelism.** `dart test` runs test files in parallel, but tests
   within a single file run sequentially. Cramming 30+ tests into one file
   means they all run on one core.

2. **Slow feedback.** If one test fails, you wait for the entire file to finish
   before seeing results.

3. **Hard to maintain.** Imports pile up, groups get deeply nested, and it
   becomes unclear what each test is actually covering.

## The fix

Split mega files into focused, per-feature test files. The project already has
the right structure with separate files for cubits, models, repositories, and
services. The mega files duplicate or aggregate what those focused files cover.

For a quick demo fix, you can simply delete or skip the mega files since the
individual test files already provide coverage:

```bash
# From the repo root:
# Option A: Delete the mega files entirely
find packages -name 'everything_test.dart' -delete
find packages -name 'integration_test.dart' -path '*/test/integration_test.dart' -delete

# Option B: Skip them by renaming (reversible)
find packages -name 'everything_test.dart' -exec mv {} {}.bak \;
find packages -name 'integration_test.dart' -path '*/test/integration_test.dart' -exec mv {} {}.bak \;
```

There is no `fix.sh` for this one because the right fix depends on context.
In a real codebase you would split, not delete. For a demo, renaming to `.bak`
is the fastest way to show the speedup.

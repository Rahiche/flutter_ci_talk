# Flutter CI Optimizations — Talk Outline

## Setup
- Open terminal in `~/flutter_ci_talk`
- Ensure on `main` branch
- Have BENCHMARKS.md open in split view

---

## Act 1: "Look how slow this is" (~5 min)
**Branch:** `main`

### Talking Points
- Show project structure: 4 packages, ~235 source files, ~239 test files
- "This looks like a typical medium-large Flutter monorepo"
- "Let's run the tests and see how long it takes"

### Demo Commands
```bash
# Show structure
find packages -name '*.dart' | wc -l
tree packages --dirsfirst -L 3

# Run the slow baseline
time sh/run_sequential.sh
```

### Expected Timing
- Sequential test run: **~7 minutes**
- Audience should feel the wait

### What to Show on Screen
- Terminal running tests — the progress bar crawling
- Point out the `Future.delayed` tests that just... wait
- The per-file isolate messages

---

## Act 2: "Fix the bad tests" (~10 min)
**Branch:** `step-1/fix-bad-tests`

### Talking Points
1. **Real async delays** — `Future.delayed(Duration(seconds: 3))` in tests
   - Fix: Use `fakeAsync` + `elapse`
   - "60-90 seconds of pure waiting across the suite"

2. **Heavy setUp** — `setUp()` running `Future.delayed(500ms)` for every test
   - Fix: Move to `setUpAll()` or scope to tests that need it
   - "500-700ms × 5 tests × multiple groups = 30+ seconds wasted"

3. **Real I/O** — Writing to `Directory.systemTemp` in tests
   - Fix: Use in-memory alternatives
   - "Disk I/O adds unpredictable latency"

4. **Mega test files** — `everything_test.dart` with 30+ tests
   - Fix: Split into focused files for better parallelism
   - "Flutter runs test FILES in parallel, but each file is sequential"

5. **Excessive pumping** — `for (int i = 0; i < 100; i++) { pump() }`
   - Fix: Use `pumpAndSettle()` or targeted pumps

### Demo Commands
```bash
git checkout step-1/fix-bad-tests
# Show the fixes
git diff main -- packages/app/test/everything_test.dart | head -80
time sh/run_sequential.sh
```

### Quick Fix (if short on time)
```bash
sh/apply_fix.sh act2_fix_async
sh/apply_fix.sh act2_fix_setup
```

---

## Act 3: "Parallelize across packages" (~10 min)
**Branch:** `step-2/parallel-packages`

### Talking Points
- "We have 4 packages but run them one at a time"
- "Flutter test already parallelizes files within a package..."
- "...but we're not parallelizing ACROSS packages"
- Show `sh/check-ci.sh` — background jobs + wait
- Total time = max(package times) instead of sum(package times)

### Demo Commands
```bash
git checkout step-2/parallel-packages

# Compare
time sh/run_sequential.sh   # slow
time sh/check-ci.sh         # fast
```

---

## Act 4: "The isolate cold start problem" (~10 min)
**Branch:** `step-3/test-bundler`

### Talking Points
- "Each test file spawns a new Dart isolate"
- "239 test files = 239 cold starts (~200-400ms each = 48-96s overhead)"
- "Coverage makes it worse: O(tests x source_files) for coverage RPC"
- Show `tool/generate_test_wrapper.dart`
- "Bundle all tests into one file = one isolate = one cold start"

### Demo Commands
```bash
git checkout step-3/test-bundler
dart run tool/generate_test_wrapper.dart
sh/demo_isolate.sh
```

---

## Act 5: "Selective builds & pub get caching" (~10 min)
**Branch:** `step-4/selective-builds`

### Talking Points

#### 5a: The pub get duplication problem
- "In a monorepo, `dart pub get` resolves at the workspace level"
- "Running `pub get` per-package per-CI-job duplicates work"
- "Solution: run `pub get` ONCE at root, cache `.dart_tool` and `~/.pub-cache`"
- "Then each test job restores from cache — no redundant resolution"
- Show the CI workflow: `actions/cache` with `pubspec.lock` hash key

#### 5b: dart analyze at workspace level
- "`dart analyze` per-package re-parses all shared dependencies"
- "Run it ONCE at the workspace root: `dart analyze .`"
- "One job, one pass, covers all packages"

#### 5c: Skip native builds for Dart-only changes
- "If only `.dart` files changed, `flutter build bundle` is 10x faster"
- "Detect native file changes (`.swift`, `.kt`, `.gradle`, etc.)"
- Show the conditional build logic in the workflow

### Demo Commands
```bash
git checkout step-4/selective-builds
cat .github/workflows/pr_check.yml
```

### What to Show
- The workflow YAML with inline comments
- The cache key strategy: `pub-${{ runner.os }}-${{ hashFiles('**/pubspec.yaml', '**/pubspec.lock') }}`
- The `setup` job that runs once, then `analyze` and `test` jobs consume the cache

---

## Act 6: "Diff coverage & dependency graph testing" (~10 min)
**Branch:** `step-5/diff-coverage`

### Talking Points

#### 6a: Diff coverage
- "Full coverage measurement is expensive with 235 source files"
- "You only need to know: did the CHANGED lines get tested?"
- "Parse lcov.info for only the files in the git diff"
- Show `sh/diff_coverage.sh`

#### 6b: Dependency-graph-aware testing
- "If only `payments/` changed, why test `analytics/`?"
- "BUT: if `core/` changed, you must test everything that depends on it"
- "Build the dependency graph from pubspec.yaml files"
- "Expand changed packages to include their dependents"
- Show `sh/affected_packages.sh`
- Example: change `core/` → tests run for `core`, `app`, `payments`, `analytics`
- Example: change `payments/` → tests run for only `payments`

### Demo Commands
```bash
git checkout step-5/diff-coverage
sh/diff_coverage.sh main
sh/affected_packages.sh main
```

---

## Final: "Everything together" (~5 min)
**Branch:** `step-6/all-optimizations`

### Talking Points
- "Let's combine everything and see the total improvement"
- Show BENCHMARKS.md with all results
- "From 7+ minutes to under 30 seconds"
- Walk through the optimization stack:
  1. Fix bad tests (remove artificial delays)
  2. Parallelize packages (background jobs)
  3. Bundle tests (reduce isolate overhead)
  4. Cache pub get (workspace-level resolution)
  5. Workspace-level analyze (one pass)
  6. Selective testing (dependency graph)
  7. Selective builds (Dart-only fast path)
  8. Diff coverage (measure what matters)

### Demo Commands
```bash
git checkout step-6/all-optimizations
cat BENCHMARKS.md
time sh/check-ci.sh
```

### The Big Reveal
- Show the benchmark table side-by-side
- "Your CI doesn't have to be slow"

---

## Key Takeaways (closing slide)
1. **Fix your tests first** — async delays, heavy setUp, real I/O
2. **Parallelize across packages** — simple shell script
3. **Bundle tests** — reduce isolate cold start overhead
4. **Cache pub get at workspace level** — don't duplicate resolution
5. **Analyze once** — workspace-level `dart analyze`
6. **Test selectively** — dependency graph determines what to test
7. **Build selectively** — skip native builds for Dart-only changes
8. **Diff coverage** — measure only what changed

---

## Timing Summary
| Act | Duration | Cumulative |
|-----|----------|------------|
| Act 1: Slow baseline | 5 min | 5 min |
| Act 2: Fix tests | 10 min | 15 min |
| Act 3: Parallel packages | 10 min | 25 min |
| Act 4: Test bundler | 10 min | 35 min |
| Act 5: Selective builds & caching | 10 min | 45 min |
| Act 6: Diff coverage & graph testing | 10 min | 55 min |
| Wrap-up | 5 min | 60 min |

Total: ~60 minutes (fits a 1-hour slot)

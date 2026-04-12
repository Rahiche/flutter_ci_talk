# Flutter CI Optimizations — Talk Outline

## Setup
- Open terminal in `~/flutter_ci_talk`
- Ensure on `main` branch
- Have BENCHMARKS.md open in split view with the GitHub Actions reference column visible

---

## Act 1: "Look how slow this is" (~5 min)
**Branch:** `main`

### Talking Points
- Show project structure: 4 packages, ~235 source files, ~239 test files
- "This looks like a typical medium-large Flutter monorepo"
- "Let's run the tests and see how long it takes"

### Run Slide Command
```bash
git checkout main && make demo-slow
```

### Reveal Slide
- Call out the benchmarked baseline: `15m 21s` sequential + coverage on GitHub Actions for `main` (344 test files, run 24317309884)

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

### Run Slide Command
```bash
git checkout step-1/fix-bad-tests
make demo-slow
```

### Reveal Slide
- Call out the benchmarked result: `5m 38s` sequential on GitHub Actions for `step-1/fix-bad-tests`

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

### Run Slide Command
```bash
git checkout step-2/parallel-packages && sh/check-ci.sh
```

### Reveal Slide
- Call out the benchmarked result: `8m 39s` on GitHub Actions for baseline + concurrent packages (with coverage, 344 test files)

---

## Act 4: "The isolate cold start problem" (~10 min)
**Branch:** `step-3/test-bundler`

### Talking Points
- "Each test file spawns a new Dart isolate"
- "239 test files = 239 cold starts (~200-400ms each = 48-96s overhead)"
- "Coverage makes it worse: O(tests x source_files) for coverage RPC"
- Show `tool/generate_test_wrapper.dart`
- "Bundle all tests into one file = one isolate = one cold start"

### Run Slide Command
```bash
git checkout step-3/test-bundler && sh/demo_isolate.sh
```

### Reveal Slide
- Show the 4-variant coverage matrix (run 24317309884):
  - Baseline sequential: **15m 21s**
  - + Concurrency: **8m 39s** (43.6% faster)
  - + Bundler: **8m 08s** (47% faster)
  - + Bundler + Concurrency: **2m 48s** (81.7% faster)
- Key talking point: bundler + concurrency is super-additive — fewer isolates × parallel execution

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

#### 5d: The hidden mobile build tax
- "Running Android and iOS builds on every commit burns money fast"
- "Android build is often ~20 minutes, iOS build is often ~20 minutes"
- "That's ~40 build minutes per commit even when code is Dart-only"
- "Use a decision gate: full native builds only when `pubspec.lock` or `android/` or `ios/` changes"
- "For most PRs, run `flutter build bundle` and skip native rebuilds"
- "At 30 PRs/day with 80% Dart-only changes, that's about 16 runner-hours saved per day"

#### 5e: Cost spotlight slide
- "Show one back-of-envelope equation live: `30 PR/day * 0.8 Dart-only * 40 min skipped = 16 runner-hours/day`"
- "This lands the business case: selective builds are not only faster, they're dramatically cheaper"

### Run Slide Command
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

#### 6c: Package structure as a CI multiplier
- "Selective testing only works if package boundaries are clean"
- "No circular dependencies, or impact analysis gets messy and risky"
- "Track blast radius per package: how many downstream packages a change retriggers"
- "Keep high-churn code in leaf packages; keep core stable and minimal"
- Show `sh/arch_guard.sh`

### Run Slide Command
```bash
git checkout step-5/diff-coverage
sh/diff_coverage.sh main
sh/affected_packages.sh main
sh/arch_guard.sh --base main
```

---

## Final: "Everything together" (~5 min)
**Branch:** `step-6/all-optimizations`

### Talking Points
- "Let's combine everything and see the total improvement"
- Use GitHub Actions as the single reference benchmark because it is the slowest environment in the repo
- "GitHub Actions: 15m 21s to 2m 48s (with coverage on 344 test files)"
- Walk through the optimization stack:
  1. Fix bad tests (remove artificial delays)
  2. Parallelize packages (background jobs)
  3. Bundle tests (reduce isolate overhead)
  4. Cache pub get (workspace-level resolution)
  5. Workspace-level analyze (one pass)
  6. Selective testing (dependency graph)
  7. Selective builds (Dart-only fast path)
8. Diff coverage (measure what matters)
9. Architecture guard (no cycles + low blast radius)

### Run Slide Command
```bash
git checkout step-6/all-optimizations && make demo-fast
```

### The Big Reveal
- Show the GitHub Actions reference benchmark column
- "Your CI doesn't have to be slow"
- Final numbers: 15m 21s → 2m 48s = **82% improvement** (with coverage, 344 test files, GitHub Actions run 24317309884)

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
9. **Design package boundaries** — no cycles, low blast radius

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

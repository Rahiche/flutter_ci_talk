# Flutter CI Optimizations — Conference Talk Demo

A realistic Flutter monorepo designed to demonstrate CI optimization techniques. The project is intentionally slow on `main`, and each branch introduces an optimization that measurably improves performance.

## Setup

```bash
# Install dependencies
dart pub get
melos bootstrap

# Generate the project (if starting fresh)
dart run tool/generate_project.dart
dart run tool/generate_extra_tests.dart
```

## Project Structure

```
flutter_ci_talk/
├── packages/
│   ├── app/          # Main app (58 test files)
│   ├── core/         # Shared components (58 test files)
│   ├── payments/     # Payment feature (64 test files)
│   └── analytics/    # Analytics feature (59 test files)
├── slides/           # Talk outline
├── tool/             # Code generators
├── sh/               # Shell scripts for CI demos
├── solutions/        # Pre-built fixes for live demo
└── BENCHMARKS.md     # Recorded timing results
```

**Total: ~235 source files, ~239 test files**

## Branch Progression

Each branch builds on the previous one:

| Branch | What it demonstrates |
|--------|---------------------|
| `main` | Baseline — all bad tests, no optimizations |
| `step-1/fix-bad-tests` | Fix async delays, heavy setUp, real I/O, mega files |
| `step-2/parallel-packages` | Parallel package execution |
| `step-3/test-bundler` | Single-isolate test wrappers |
| `step-4/selective-builds` | Change detection, selective builds, pub get caching |
| `step-5/diff-coverage` | Diff-only coverage + dependency graph testing |
| `step-6/all-optimizations` | Everything combined |

## Running the Demo

```bash
# Slow baseline (main branch)
make demo-slow           # ~7 min sequential

# Fast version (step-6 branch)
make demo-fast           # ~30s parallel + bundled

# Individual scripts
sh/run_sequential.sh     # Sequential test run
sh/check-ci.sh           # Parallel test run
sh/demo_isolate.sh       # Isolate comparison demo
sh/diff_coverage.sh      # Diff coverage demo
sh/affected_packages.sh  # Dependency graph testing
```

## Running the Slides

```bash
# Serve slides locally
python3 -m http.server 8000 --directory slides
# Open in your browser
$BROWSER http://localhost:8000
```

## Quick Fixes (for live demo)

```bash
# Apply a pre-built fix during the talk
make apply-fix FIX=act2_fix_async
make apply-fix FIX=act2_fix_setup
make apply-fix FIX=act2_fix_io
make apply-fix FIX=act2_fix_mega_files
```

## Key Metrics

See [BENCHMARKS.md](BENCHMARKS.md) for recorded timing results.

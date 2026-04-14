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

## Slides

The talk slides are in `slides/index.html` and use [reveal.js](https://revealjs.com/) loaded from CDN.

```bash
# Serve with Python (no install needed)
python3 -m http.server 8080 --directory slides

# Or with Node.js (npx)
npx serve slides

# Then open in your browser
open http://localhost:8080
```

Navigate slides with arrow keys. Press `F` for fullscreen, `S` for speaker notes, `?` for all shortcuts.

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
sh/arch_guard.sh         # Circular dependency + blast radius guard
```

## Architecture Rule For Fast CI

Fast selective CI depends on package boundaries.

- Keep package dependencies acyclic (no circular package dependencies)
- Keep high-churn features as leaf packages
- Avoid turning one package into a mega shared dependency
- Measure blast radius: if package `X` changes, how many other packages must be retested?

Run the architecture guard:

```bash
# Report cycles + blast radius + affected packages vs main
sh/arch_guard.sh

# Enforce limits in CI (example)
sh/arch_guard.sh --base main --max-affected 2 --max-blast-radius 2
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

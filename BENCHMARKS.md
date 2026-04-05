# Benchmark Results

Machine: Apple M4 Max (macOS Darwin 25.2.0)
Flutter: 3.35.7 (stable) / Dart 3.9.2
Date: 2026-04-05
Test files: 239 across 4 packages (235 source files)

| Branch | Command | Duration | Notes |
|--------|---------|----------|-------|
| main | `flutter test` (sequential, all packages) | 7m 12s | Baseline — bad tests, sequential, per-file isolates |
| step-1/fix-bad-tests | `flutter test` (sequential, all packages) | — | Fixed async delays, heavy setUp, real I/O, split mega files |
| step-2/parallel-packages | `sh/check-ci.sh` | — | Parallel package execution |
| step-3/test-bundler | `sh/check-ci.sh` with bundler | — | Single-isolate wrappers + parallel |
| step-4/selective-builds | `.github/workflows/pr_check.yml` | — | Shared pub get cache, workspace analyze, selective test/build |
| step-5/diff-coverage | `sh/diff_coverage.sh` + `sh/affected_packages.sh` | — | Coverage for changed lines only + dependency graph testing |
| step-6/all-optimizations | full pipeline | — | Everything combined |

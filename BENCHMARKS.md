# Benchmark Results

Test files: 239 across 4 packages (235 source files)

## Cross-Environment Summary

| Stage | Branch | Command | Local: M4 Max | Local: Codespaces (2 vCPU) | GitHub Actions Ubuntu | Notes |
|---|---|---|---:|---:|---:|---|
| Baseline | `main` | `make demo-slow` | 7m 12s | 14m 35s | 17m 15s | Sequential, per-file isolates, intentionally bad tests |
| Fix bad tests | `step-1/fix-bad-tests` | `make demo-slow` | 34s | 3m 55s | 5m 38s | Removed artificial delays, heavy setUp, real I/O, mega files |
| Parallel packages | `step-2/parallel-packages` | `sh/check-ci.sh` | 17s | 2m 51s | 4m 29s | Package-level parallel execution |
| Test bundler | `step-3/test-bundler` | bundled path | 14s | 1m 03s | 4m 37s | Codespaces local report also recorded 3m 54s for the normal non-bundled run |
| Selective builds | `step-4/selective-builds` | CI workflow | n/a | n/a | 4m 56s failed | CI-only optimization; benchmark run failed, so this is runtime-to-failure |
| Diff coverage | `step-5/diff-coverage` | `sh/diff_coverage.sh` + `sh/affected_packages.sh` | n/a | n/a | 1m 16s | Per-change CI optimization, not directly comparable to full local demo runs |
| All optimizations | `step-6/all-optimizations` | `make demo-fast` | ~14s | 31s | 2m 15s | Combined result: fixed tests + parallel + bundled + selective |

## Sources

### Local desktop benchmark

- Machine: Apple M4 Max (macOS Darwin 25.2.0)
- Flutter: 3.35.7 (stable) / Dart 3.9.2
- Date: 2026-04-05
- Source: tracked benchmark table in this branch

### Local cloud benchmark

- Device type: GitHub Codespaces (cloud VM)
- Host: `codespaces-93c42b`
- OS: Linux 6.8.0-1044-azure x86_64
- CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz
- vCPU count: 2
- Memory: 7.8 GiB
- Flutter: 3.41.6 (stable)
- Dart: 3.11.4
- Run date: 2026-04-11 UTC
- Source report: `bench/all_optimizations-20260411-150040:benchmarks/local/codespaces-93c42b-2026-04-11.md`

### GitHub Actions benchmark runs

- Workflow: `Benchmark Dispatch`
- Repo: `Rahiche/flutter_ci_talk`
- CI timings above are workflow wall-clock durations from successful benchmark runs where available
- Baseline used run `24284636313` because the later `150040` baseline batch failed
- Other CI timings use the `20260411-150040` batch runs: `24285087150`, `24285087193`, `24285087380`, `24285087785`, `24285087924`

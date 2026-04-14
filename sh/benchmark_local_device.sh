#!/usr/bin/env bash
set -euo pipefail

# Run local benchmark stages used in the presentation and emit a markdown report.
# Usage:
#   sh/benchmark_local_device.sh [output_md]
# Example:
#   sh/benchmark_local_device.sh benchmarks/local/my-laptop.md

OUT_FILE="${1:-benchmarks/local/benchmark-$(hostname)-$(date -u +%Y%m%d-%H%M%S).md}"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PATH="/home/codespace/flutter/bin:$PATH"

mkdir -p "$(dirname "$OUT_FILE")"

run_case() {
  local label="$1"
  local branch="$2"
  local command="$3"
  local summary_regex="$4"
  local log_file="/tmp/bench_${label}.log"

  echo "Running $label on $branch"
  git -C "$ROOT_DIR" checkout "$branch" >/dev/null 2>&1

  local start end elapsed status summary
  start=$(date +%s)
  set +e
  (cd "$ROOT_DIR" && bash -lc "export PATH=/home/codespace/flutter/bin:\$PATH; $command") >"$log_file" 2>&1
  status=$?
  set -e
  end=$(date +%s)
  elapsed=$((end - start))

  summary=""
  if [[ -n "$summary_regex" ]]; then
    summary="$(grep -E "$summary_regex" "$log_file" | tail -n 3 | tr '\n' '; ' | sed 's/; $//')"
  fi

  echo "$label|$branch|$elapsed|$status|$summary|$log_file"
}

DEVICE_HOST="$(hostname)"
OS_LINE="$(uname -a)"
CPU_MODEL="$(lscpu | awk -F: '/Model name/{gsub(/^ +/,"",$2); print $2; exit}')"
CPU_CORES="$(lscpu | awk -F: '/^CPU\(s\)/{gsub(/^ +/,"",$2); print $2; exit}')"
MEM_TOTAL="$(free -h | awk '/^Mem:/{print $2}')"
FLUTTER_VERSION="$(flutter --version | head -n 1)"
DART_VERSION="$(dart --version 2>&1 | head -n 1)"
RUN_AT="$(date -u +"%Y-%m-%d %H:%M:%S UTC")"

RESULT_MAIN="$(run_case baseline_main main "make demo-slow" "=== Sequential total:")"
RESULT_STEP1="$(run_case step1_fix_bad_tests step-1/fix-bad-tests "make demo-slow" "=== Sequential total:")"
RESULT_STEP2="$(run_case step2_parallel_packages step-2/parallel-packages "sh/check-ci.sh" "=== Parallel total:")"
RESULT_STEP3="$(run_case step3_test_bundler step-3/test-bundler "sh/demo_isolate.sh" "Normal run:|Bundled run:|Saved:")"
RESULT_STEP6="$(run_case step6_all_optimizations step-6/all-optimizations "make demo-fast" "=== Parallel total:")"

# Keep repository on fully optimized branch for convenience.
git -C "$ROOT_DIR" checkout step-6/all-optimizations >/dev/null 2>&1 || true

to_row() {
  local line="$1"
  IFS='|' read -r label branch seconds status summary log_file <<< "$line"
  local mins=$((seconds / 60))
  local rem=$((seconds % 60))
  printf '| %s | %s | %ss (%sm %ss) | %s | %s | %s |\n' "$label" "$branch" "$seconds" "$mins" "$rem" "$status" "$summary" "$log_file"
}

{
  echo "# Local Benchmark Report"
  echo
  echo "- Run at: $RUN_AT"
  echo "- Host: $DEVICE_HOST"
  echo "- OS: $OS_LINE"
  echo "- CPU: $CPU_MODEL"
  echo "- vCPU count: $CPU_CORES"
  echo "- Memory: $MEM_TOTAL"
  echo "- Flutter: $FLUTTER_VERSION"
  echo "- Dart: $DART_VERSION"
  echo
  echo "## Results"
  echo
  echo "| Stage | Branch | Wall Time | Exit Status | Script Summary | Log |"
  echo "|---|---|---:|---:|---|---|"
  to_row "$RESULT_MAIN"
  to_row "$RESULT_STEP1"
  to_row "$RESULT_STEP2"
  to_row "$RESULT_STEP3"
  to_row "$RESULT_STEP6"
  echo
  echo "## Compare On Another Device"
  echo
  echo "Run this command in the repository root:"
  echo
  echo '```bash'
  echo 'sh/benchmark_local_device.sh benchmarks/local/<your-device-name>.md'
  echo '```'
  echo
  echo "Then compare files side by side using your preferred diff tool."
} > "$OUT_FILE"

echo "Benchmark report written to $OUT_FILE"
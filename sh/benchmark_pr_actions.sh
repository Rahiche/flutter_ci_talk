#!/usr/bin/env bash
set -euo pipefail

# Trigger per-stage benchmark workflow runs (no merge required) and record metrics.
# Default mode is dry-run.

usage() {
  cat <<'USAGE'
Usage: sh/benchmark_pr_actions.sh [options]

Options:
  --execute                 Perform real git push + workflow dispatch + run waits.
  --allow-dirty             Stash and restore local changes during --execute.
  --repo OWNER/NAME         GitHub repo (default: inferred via gh repo view).
  --base BRANCH             Base branch name used in metadata (default: main).
  --results-file PATH       Markdown output file.
  --stages SPEC             Comma-separated label=source-branch mapping.
  --cleanup-branches        Delete temporary benchmark branches after completion.
  -h, --help                Show help.

Default stages:
  baseline=main,
  fix_bad_tests=step-1/fix-bad-tests,
  parallel_packages=step-2/parallel-packages,
  test_bundler=step-3/test-bundler,
  selective_builds=step-4/selective-builds,
  diff_coverage=step-5/diff-coverage,
  all_optimizations=step-6/all-optimizations
USAGE
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

slugify() {
  echo "$1" | tr '/ ' '--' | tr -cd '[:alnum:]-_'
}

iso_to_epoch() {
  date -u -d "$1" +%s
}

stage_command() {
  case "$1" in
    baseline) echo "sh/run_sequential.sh" ;;
    fix_bad_tests) echo "sh/run_sequential.sh" ;;
    parallel_packages) echo "sh/check-ci.sh" ;;
    test_bundler) echo "dart run tool/generate_test_wrapper.dart && sh/check-ci.sh" ;;
    selective_builds) echo "dart pub get && dart analyze . && sh/check-ci.sh && (cd packages/app && flutter build bundle)" ;;
    diff_coverage) echo "sh/diff_coverage.sh main && sh/affected_packages.sh main" ;;
    all_optimizations) echo "make demo-fast" ;;
    *) echo "sh/run_sequential.sh" ;;
  esac
}

append_row() {
  local file="$1"
  local stage="$2"
  local source_branch="$3"
  local bench_branch="$4"
  local conclusion="$5"
  local wall_seconds="$6"
  local billable_minutes="$7"
  local run_url="$8"

  printf '| %s | %s | %s | %s | %s | %s | %s |\n' \
    "$stage" "$source_branch" "$bench_branch" "$conclusion" "$wall_seconds" "$billable_minutes" "$run_url" >> "$file"
}

EXECUTE=0
ALLOW_DIRTY=0
CLEANUP_BRANCHES=0
BASE_BRANCH="main"
REPO=""
STAGES_SPEC="baseline=main,fix_bad_tests=step-1/fix-bad-tests,parallel_packages=step-2/parallel-packages,test_bundler=step-3/test-bundler,selective_builds=step-4/selective-builds,diff_coverage=step-5/diff-coverage,all_optimizations=step-6/all-optimizations"
TIMESTAMP="$(date -u +%Y%m%d-%H%M%S)"
RESULTS_FILE="benchmarks/actions/gh-actions-benchmark-${TIMESTAMP}.md"
WORKFLOW_FILE=".github/workflows/benchmark_dispatch.yml"
WORKFLOW_NAME="Benchmark Dispatch"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --execute)
      EXECUTE=1
      shift
      ;;
    --allow-dirty)
      ALLOW_DIRTY=1
      shift
      ;;
    --cleanup-branches)
      CLEANUP_BRANCHES=1
      shift
      ;;
    --repo)
      REPO="$2"
      shift 2
      ;;
    --base)
      BASE_BRANCH="$2"
      shift 2
      ;;
    --results-file)
      RESULTS_FILE="$2"
      shift 2
      ;;
    --stages)
      STAGES_SPEC="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
done

require_cmd git
require_cmd gh

if [[ -z "$REPO" ]]; then
  REPO="$(gh repo view --json nameWithOwner --jq .nameWithOwner)"
fi

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub CLI is not authenticated. Run: gh auth login" >&2
  exit 1
fi

if [[ $EXECUTE -eq 1 && -n "$(git status --porcelain)" && $ALLOW_DIRTY -eq 0 ]]; then
  echo "Working tree is not clean. Commit/stash changes before --execute, or use --allow-dirty." >&2
  exit 1
fi

mkdir -p "$(dirname "$RESULTS_FILE")"
cat > "$RESULTS_FILE" <<EOF_MD
# GitHub Actions Benchmark Report

- Generated: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
- Repo: ${REPO}
- Base branch: ${BASE_BRANCH}
- Workflow: ${WORKFLOW_NAME}
- Mode: $( [[ $EXECUTE -eq 1 ]] && echo "execute" || echo "dry-run" )

| Stage | Source Branch | Benchmark Branch | Conclusion | Wall Seconds | Billable Minutes (Ubuntu) | Run URL |
|---|---|---|---|---:|---:|---|
EOF_MD

CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD)"
STASH_REF=""
CREATED_BENCH_BRANCHES=()

if [[ $EXECUTE -eq 1 && $ALLOW_DIRTY -eq 1 && -n "$(git status --porcelain)" ]]; then
  git stash push -u -m "bench-actions-${TIMESTAMP}" >/dev/null
  STASH_REF="$(git stash list --format='%gd %s' | grep "bench-actions-${TIMESTAMP}" | head -n1 | awk '{print $1}')"
fi

cleanup() {
  git checkout "$CURRENT_BRANCH" >/dev/null 2>&1 || true
  if [[ $CLEANUP_BRANCHES -eq 1 ]]; then
    for b in "${CREATED_BENCH_BRANCHES[@]}"; do
      git push origin --delete "$b" >/dev/null 2>&1 || true
    done
  fi
  if [[ -n "$STASH_REF" ]]; then
    git stash pop "$STASH_REF" >/dev/null 2>&1 || true
  fi
}
trap cleanup EXIT

IFS=',' read -r -a STAGE_PAIRS <<< "$STAGES_SPEC"

for pair in "${STAGE_PAIRS[@]}"; do
  stage="${pair%%=*}"
  source_branch="${pair#*=}"
  bench_branch="bench/$(slugify "$stage")-${TIMESTAMP}"
  cmd="$(stage_command "$stage")"

  if [[ $EXECUTE -eq 0 ]]; then
    echo "[DRY-RUN] stage=$stage source=$source_branch bench=$bench_branch cmd=$cmd"
    append_row "$RESULTS_FILE" "$stage" "$source_branch" "$bench_branch" "(dry-run)" "" "" ""
    continue
  fi

  echo "=== Stage: $stage (source: $source_branch) ==="

  git fetch origin --prune >/dev/null
  git checkout "$source_branch" >/dev/null
  git checkout -B "$bench_branch" >/dev/null

  mkdir -p .github/workflows
  cat > "$WORKFLOW_FILE" <<'EOF_WF'
name: Benchmark Dispatch

on:
  workflow_dispatch:
    inputs:
      benchmark_stage:
        description: Stage label
        required: true
        type: string
      benchmark_command:
        description: Command to benchmark
        required: true
        type: string

jobs:
  benchmark:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: subosito/flutter-action@v2
        with:
          channel: stable
      - name: Install dependencies
        run: dart pub get
      - name: Run benchmark command
        run: |
          echo "Stage: \\${{ inputs.benchmark_stage }}"
          echo "Command: \\${{ inputs.benchmark_command }}"
          bash -lc "\\${{ inputs.benchmark_command }}"
EOF_WF

  mkdir -p .benchmarks
  printf 'stage=%s\nsource=%s\ncmd=%s\ntime=%s\n' "$stage" "$source_branch" "$cmd" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > ".benchmarks/dispatch-${TIMESTAMP}.txt"

  git add "$WORKFLOW_FILE" ".benchmarks/dispatch-${TIMESTAMP}.txt"
  git commit -m "bench(actions): dispatch benchmark for ${stage}" >/dev/null

  git push -u origin "$bench_branch" >/dev/null
  CREATED_BENCH_BRANCHES+=("$bench_branch")

  gh workflow run benchmark_dispatch.yml \
    --repo "$REPO" \
    --ref "$bench_branch" \
    -f benchmark_stage="$stage" \
    -f benchmark_command="$cmd" >/dev/null

  run_id="$(gh run list \
    --repo "$REPO" \
    --workflow "$WORKFLOW_NAME" \
    --branch "$bench_branch" \
    --event workflow_dispatch \
    --json databaseId \
    --limit 1 \
    --jq '.[0].databaseId')"

  if [[ -z "$run_id" || "$run_id" == "null" ]]; then
    append_row "$RESULTS_FILE" "$stage" "$source_branch" "$bench_branch" "missing-run" "" "" ""
    continue
  fi

  gh run watch "$run_id" --repo "$REPO" >/dev/null || true

  conclusion="$(gh run view "$run_id" --repo "$REPO" --json conclusion --jq .conclusion)"
  run_url="$(gh run view "$run_id" --repo "$REPO" --json url --jq .url)"
  created_at="$(gh run view "$run_id" --repo "$REPO" --json createdAt --jq .createdAt)"
  updated_at="$(gh run view "$run_id" --repo "$REPO" --json updatedAt --jq .updatedAt)"

  wall_seconds=""
  if [[ -n "$created_at" && -n "$updated_at" && "$created_at" != "null" && "$updated_at" != "null" ]]; then
    start_epoch="$(iso_to_epoch "$created_at")"
    end_epoch="$(iso_to_epoch "$updated_at")"
    wall_seconds="$((end_epoch - start_epoch))"
  fi

  billable_ms="$(gh api "repos/${REPO}/actions/runs/${run_id}/timing" --jq '.billable.UBUNTU.total_ms' 2>/dev/null || true)"
  billable_minutes=""
  if [[ -n "$billable_ms" && "$billable_ms" != "null" ]]; then
    billable_minutes="$(( (billable_ms + 59999) / 60000 ))"
  fi

  append_row "$RESULTS_FILE" "$stage" "$source_branch" "$bench_branch" "$conclusion" "$wall_seconds" "$billable_minutes" "$run_url"
done

echo "Report written: $RESULTS_FILE"

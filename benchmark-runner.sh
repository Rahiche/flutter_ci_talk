#!/bin/bash
#
# Benchmark Runner - Dispatch multiple benchmark scenarios to GitHub Actions
# Usage: ./benchmark-runner.sh [--dry-run]
#

set -e

REPO="Rahiche/flutter_ci_talk"
WORKFLOW="benchmark_dispatch.yml"
DRY_RUN=false

# Check for dry-run flag
if [[ "$1" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "🏃 DRY RUN MODE: Will show commands without executing"
  echo ""
fi

# Define benchmark scenarios for the coverage + concurrency matrix
# Format: branch_name|stage_label|command
scenarios=(
  "bench-baseline-seq|Baseline Sequential|echo 'Baseline: Sequential execution'; sleep 1s"
  "bench-baseline-concurrent|Baseline + Concurrent|echo 'Baseline: Concurrent execution (j=4)'; sleep 1s"
  "bench-bundler-seq|Test Bundler Sequential|echo 'Bundler: Sequential execution'; sleep 1s"
  "bench-bundler-concurrent|Test Bundler + Concurrent|echo 'Bundler: Concurrent execution (j=4)'; sleep 1s"
)

declare -a RUN_DATA

echo "════════════════════════════════════════════════════════════"
echo "  Flutter CI Benchmarking - Workflow Dispatcher"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "Repository: $REPO"
echo "Workflow: $WORKFLOW"
echo "Scenarios: ${#scenarios[@]}"
echo ""

for scenario in "${scenarios[@]}"; do
  IFS='|' read -r branch stage command <<< "$scenario"
  
  echo "───────────────────────────────────────────────────────────"
  echo "Scenario: $stage"
  echo "  Branch: $branch"
  echo "  Command: $command"
  echo ""
  
  if [[ "$DRY_RUN" == "true" ]]; then
    echo "  [DRY RUN] git checkout -b $branch origin/main"
    echo "  [DRY RUN] git push -u origin $branch"
    echo "  [DRY RUN] gh workflow run $WORKFLOW \\"
    echo "    --repo $REPO \\"
    echo "    --ref $branch \\"
    echo "    -f benchmark_stage='$stage' \\"
    echo "    -f benchmark_command='$command'"
  else
    # Create/checkout branch
    git checkout -b "$branch" origin/main 2>/dev/null || git checkout "$branch"
    
    # Push branch
    git push -u origin "$branch" --force 2>&1 | grep -E "^\s|branch|To https" || true
    
    # Dispatch workflow
    echo "  Dispatching workflow..."
    gh workflow run "$WORKFLOW" \
      --repo "$REPO" \
      --ref "$branch" \
      -f "benchmark_stage=$stage" \
      -f "benchmark_command=$command" 2>&1 || {
        echo "  ⚠️  Workflow dispatch may require elevated permissions."
        echo "     Alternative: Manually trigger via GitHub UI:"
        echo "     https://github.com/$REPO/actions/workflows/$WORKFLOW"
      }
  fi
  
  RUN_DATA+=("$stage|$branch")
  sleep 2
  echo ""
done

echo "════════════════════════════════════════════════════════════"
echo "  Benchmark Jobs Submitted"
echo "════════════════════════════════════════════════════════════"
echo ""

for run_info in "${RUN_DATA[@]}"; do
  IFS='|' read -r stage branch <<< "$run_info"
  echo "  ✓ $stage"
  echo "    Branch: $branch"
done

echo ""
echo "To monitor runs:"
echo "  gh run list --repo $REPO --workflow $WORKFLOW --limit 10"
echo ""
echo "To watch a specific run:"
echo "  gh run watch RUN_ID --repo $REPO"
echo ""
echo "Dashboard:"
echo "  https://github.com/$REPO/actions/workflows/$WORKFLOW"

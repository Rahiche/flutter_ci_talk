#!/usr/bin/env bash
set -uo pipefail

# Run all package tests in parallel
START=$(date +%s)

echo "=== Running tests in parallel ==="
echo ""

PIDS=()
PKG_NAMES=()
TMPDIR_BASE=$(mktemp -d)

for pkg in packages/*/; do
  if [ -d "$pkg/test" ]; then
    PKG_NAME=$(basename "$pkg")
    PKG_NAMES+=("$PKG_NAME")
    LOG="$TMPDIR_BASE/$PKG_NAME.log"
    (
      cd "$pkg"
      PKG_START=$(date +%s)
      TEST_TARGET=""
      if [ -f "test/all_tests.dart" ]; then
        TEST_TARGET="test/all_tests.dart"
      fi
      if flutter test ${TEST_TARGET} > "$LOG" 2>&1; then
        PKG_END=$(date +%s)
        echo "PASS:$PKG_NAME:$((PKG_END - PKG_START))" >> "$TMPDIR_BASE/results.txt"
      else
        PKG_END=$(date +%s)
        echo "FAIL:$PKG_NAME:$((PKG_END - PKG_START))" >> "$TMPDIR_BASE/results.txt"
      fi
    ) &
    PIDS+=($!)
  fi
done

# Wait for all
FAILED=0
for pid in "${PIDS[@]}"; do
  if ! wait "$pid"; then
    FAILED=1
  fi
done

END=$(date +%s)
ELAPSED=$((END - START))
MINS=$((ELAPSED / 60))
SECS=$((ELAPSED % 60))

echo "=== Results ==="
if [ -f "$TMPDIR_BASE/results.txt" ]; then
  while IFS=: read -r status name duration; do
    if [ "$status" = "PASS" ]; then
      echo "  ✓ $name (${duration}s)"
    else
      echo "  ✗ $name FAILED (${duration}s)"
      FAILED=1
    fi
  done < "$TMPDIR_BASE/results.txt"
fi

echo ""
echo "=== Parallel total: ${MINS}m ${SECS}s ==="

rm -rf "$TMPDIR_BASE"
exit $FAILED

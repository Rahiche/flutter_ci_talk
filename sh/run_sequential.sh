#!/usr/bin/env bash
set -euo pipefail

# Run all package tests sequentially (the slow way)
START=$(date +%s)

echo "=== Running tests sequentially ==="
echo ""

FAILED=0

for pkg in packages/*/; do
  if [ -d "$pkg/test" ]; then
    PKG_NAME=$(basename "$pkg")
    echo "--- Testing $PKG_NAME ---"
    PKG_START=$(date +%s)
    if (cd "$pkg" && flutter test 2>&1); then
      PKG_END=$(date +%s)
      echo "  ✓ $PKG_NAME passed ($((PKG_END - PKG_START))s)"
    else
      PKG_END=$(date +%s)
      echo "  ✗ $PKG_NAME FAILED ($((PKG_END - PKG_START))s)"
      FAILED=1
    fi
    echo ""
  fi
done

END=$(date +%s)
ELAPSED=$((END - START))
MINS=$((ELAPSED / 60))
SECS=$((ELAPSED % 60))

echo "=== Sequential total: ${MINS}m ${SECS}s ==="

exit $FAILED

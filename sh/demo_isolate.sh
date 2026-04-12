#!/usr/bin/env bash
set -euo pipefail

# Demonstrate the isolate cold start problem and the bundler solution

echo "=== Isolate Cold Start Demo ==="
echo ""

# Step 1: Run tests normally (each file = new isolate)
echo "--- Step 1: Normal test run (per-file isolates) ---"
START1=$(date +%s)
for pkg in packages/*/; do
  if [ -d "$pkg/test" ] && grep -q 'sdk: flutter' "$pkg/pubspec.yaml"; then
    (cd "$pkg" && flutter test 2>&1 | tail -1)
  fi
done
END1=$(date +%s)
NORMAL=$((END1 - START1))
echo "Normal run: ${NORMAL}s"
echo ""

# Step 2: Generate bundled wrapper
echo "--- Step 2: Generate test wrappers ---"
dart run tool/generate_test_wrapper.dart
echo ""

# Step 3: Run bundled tests
echo "--- Step 3: Bundled test run (single isolate per package) ---"
START2=$(date +%s)
for pkg in packages/*/; do
  if [ -d "$pkg/test" ] && grep -q 'sdk: flutter' "$pkg/pubspec.yaml" && [ -f "$pkg/test/all_tests.dart" ]; then
    (cd "$pkg" && flutter test test/all_tests.dart 2>&1 | tail -1)
  fi
done
END2=$(date +%s)
BUNDLED=$((END2 - START2))
echo "Bundled run: ${BUNDLED}s"
echo ""

# Compare
echo "=== Comparison ==="
echo "Normal (per-file):  ${NORMAL}s"
echo "Bundled (single):   ${BUNDLED}s"
SAVED=$((NORMAL - BUNDLED))
if [ $NORMAL -gt 0 ]; then
  PCT=$((SAVED * 100 / NORMAL))
  echo "Saved: ${SAVED}s (${PCT}% faster)"
fi

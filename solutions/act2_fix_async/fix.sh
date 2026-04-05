#!/usr/bin/env bash
# fix.sh -- Replace artificial Future.delayed waits with Duration.zero
# Run from the repo root: ./solutions/act2_fix_async/fix.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PACKAGES_DIR="$REPO_ROOT/packages"

echo "=== Act 2 Fix: Async Delays ==="
echo "Scanning for Future.delayed(const Duration(seconds: 2)) in test files..."
echo ""

count=0
while IFS= read -r -d '' file; do
  if grep -q 'Future\.delayed(const Duration(seconds: 2))' "$file"; then
    echo "  Fixing: ${file#$REPO_ROOT/}"
    sed -i '' 's/await Future\.delayed(const Duration(seconds: 2));/await Future.delayed(Duration.zero);/g' "$file"
    count=$((count + 1))
  fi
done < <(find "$PACKAGES_DIR" -name '*_test.dart' -print0)

echo ""
echo "Fixed $count files."
echo "Replaced 'Future.delayed(const Duration(seconds: 2))' with 'Future.delayed(Duration.zero)'."
echo ""
echo "Tip: In real code, use fakeAsync or mock the timer instead of delaying at all."

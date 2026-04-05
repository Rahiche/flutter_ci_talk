#!/usr/bin/env bash
# fix.sh -- Remove artificial delays from setUp() blocks in integration tests
# Run from the repo root: ./solutions/act2_fix_setup/fix.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PACKAGES_DIR="$REPO_ROOT/packages"

echo "=== Act 2 Fix: Heavy setUp ==="
echo "Scanning for setUp blocks with Future.delayed in integration tests..."
echo ""

count=0
while IFS= read -r -d '' file; do
  if grep -q 'Future\.delayed(const Duration(milliseconds: 500))' "$file"; then
    echo "  Fixing: ${file#$REPO_ROOT/}"
    sed -i '' 's/await Future\.delayed(const Duration(milliseconds: 500));/\/\/ delay removed -- was 500ms/g' "$file"
    count=$((count + 1))
  fi
done < <(find "$PACKAGES_DIR" -name '*_test.dart' -print0)

echo ""
echo "Fixed $count files."
echo ""
echo "What changed:"
echo "  - Removed 'Future.delayed(const Duration(milliseconds: 500))' from setUp blocks"
echo "  - Each test in the group no longer waits 500ms before running"
echo ""
echo "Tip: If setUp needs real async init, use setUpAll() so it runs once per group,"
echo "     not once per test."

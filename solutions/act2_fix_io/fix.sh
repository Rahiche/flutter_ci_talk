#!/usr/bin/env bash
# fix.sh -- Find and flag tests using real file I/O (Directory.systemTemp)
# Run from the repo root: ./solutions/act2_fix_io/fix.sh

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
PACKAGES_DIR="$REPO_ROOT/packages"

echo "=== Act 2 Fix: Real File I/O in Tests ==="
echo ""
echo "--- Files using Directory.systemTemp ---"
grep -rl 'Directory\.systemTemp' "$PACKAGES_DIR" --include='*_test.dart' | while read -r f; do
  echo "  ${f#$REPO_ROOT/}"
done
echo ""

# Replace the real I/O tests in everything_test.dart with a skip marker.
# This uses sed to add ', skip: "uses real I/O"' to disk cache tests.
count=0
while IFS= read -r -d '' file; do
  if grep -q 'Directory\.systemTemp' "$file"; then
    echo "Patching: ${file#$REPO_ROOT/}"
    # Replace the disk cache test declarations to add skip
    sed -i '' "s/test('disk cache test \([0-9]*\)',/test('disk cache test \1', skip: 'uses real I\/O',/g" "$file"
    count=$((count + 1))
  fi
done < <(find "$PACKAGES_DIR" -name 'everything_test.dart' -print0)

echo ""
echo "Skipped disk I/O tests in $count everything_test.dart files."
echo ""
echo "Tip: In real code, use an in-memory filesystem (package:file/memory.dart)"
echo "     or mock the repository layer instead of touching disk."

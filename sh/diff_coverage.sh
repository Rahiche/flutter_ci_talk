#!/usr/bin/env bash
set -euo pipefail

# Compute coverage only for changed lines (diff coverage)
# Usage: sh/diff_coverage.sh [base_branch]

BASE="${1:-main}"
START=$(date +%s)

echo "=== Diff Coverage (vs $BASE) ==="
echo ""

# Get changed Dart files
CHANGED_FILES=$(git diff --name-only "$BASE" -- '*.dart' | grep -v '_test.dart' | grep -v '.g.dart' || true)

if [ -z "$CHANGED_FILES" ]; then
  echo "No Dart source files changed."
  exit 0
fi

echo "Changed files:"
echo "$CHANGED_FILES" | while read -r f; do echo "  $f"; done
echo ""

# Determine affected packages
AFFECTED_PKGS=$(echo "$CHANGED_FILES" | sed -n 's|packages/\([^/]*\)/.*|\1|p' | sort -u)

echo "Affected packages: $AFFECTED_PKGS"
echo ""

# Run coverage for affected packages only
TOTAL_LINES=0
COVERED_LINES=0

for pkg in $AFFECTED_PKGS; do
  PKG_DIR="packages/$pkg"
  if [ -d "$PKG_DIR/test" ]; then
    echo "--- Running coverage for $pkg ---"
    (cd "$PKG_DIR" && flutter test --coverage 2>&1 | tail -3)

    if [ -f "$PKG_DIR/coverage/lcov.info" ]; then
      # Parse lcov for changed files only
      PKG_CHANGED=$(echo "$CHANGED_FILES" | grep "^packages/$pkg/" | sed "s|packages/$pkg/||" || true)
      for file in $PKG_CHANGED; do
        # Extract coverage data for this specific file
        IN_FILE=0
        while IFS= read -r line; do
          case "$line" in
            SF:*"$file") IN_FILE=1 ;;
            end_of_record) IN_FILE=0 ;;
            DA:*)
              if [ $IN_FILE -eq 1 ]; then
                HITS=$(echo "$line" | cut -d, -f2)
                TOTAL_LINES=$((TOTAL_LINES + 1))
                if [ "$HITS" -gt 0 ] 2>/dev/null; then
                  COVERED_LINES=$((COVERED_LINES + 1))
                fi
              fi
              ;;
          esac
        done < "$PKG_DIR/coverage/lcov.info"
      done
    fi
    echo ""
  fi
done

END=$(date +%s)
ELAPSED=$((END - START))

echo "=== Diff Coverage Results ==="
if [ $TOTAL_LINES -gt 0 ]; then
  PCT=$((COVERED_LINES * 100 / TOTAL_LINES))
  echo "Changed lines: $TOTAL_LINES"
  echo "Covered lines: $COVERED_LINES"
  echo "Diff coverage:  ${PCT}%"
else
  echo "No measurable coverage data for changed files."
fi
echo "Time: ${ELAPSED}s"

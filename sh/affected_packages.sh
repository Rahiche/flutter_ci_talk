#!/usr/bin/env bash
set -euo pipefail

# Dependency-graph-aware selective testing.
# Only tests packages that changed AND packages that depend on them.
#
# Usage: sh/affected_packages.sh [base_branch]
#
# Example: if 'core' changed, this will also test 'app', 'payments',
# and 'analytics' because they depend on 'core'.

BASE="${1:-main}"

echo "=== Affected Package Detection (vs $BASE) ==="
echo ""

# Step 1: Find which packages have changed files
CHANGED_FILES=$(git diff --name-only "$BASE" -- 'packages/' 2>/dev/null || true)

if [ -z "$CHANGED_FILES" ]; then
  echo "No package files changed."
  exit 0
fi

DIRECTLY_CHANGED=$(echo "$CHANGED_FILES" | sed -n 's|packages/\([^/]*\)/.*|\1|p' | sort -u)
echo "Directly changed packages:"
for pkg in $DIRECTLY_CHANGED; do
  echo "  - $pkg"
done
echo ""

# Step 2: Build dependency graph from pubspec.yaml files
# Parse each package's pubspec to find local dependencies
declare -A DEPENDENTS

for pkg_dir in packages/*/; do
  pkg_name=$(basename "$pkg_dir")
  if [ -f "$pkg_dir/pubspec.yaml" ]; then
    # Find local package dependencies (packages in this monorepo)
    for other_pkg in packages/*/; do
      other_name=$(basename "$other_pkg")
      if [ "$pkg_name" != "$other_name" ]; then
        # Check if this package depends on the other
        if grep -q "^\s*$other_name:" "$pkg_dir/pubspec.yaml" 2>/dev/null; then
          DEPENDENTS[$other_name]="${DEPENDENTS[$other_name]:-} $pkg_name"
        fi
      fi
    done
  fi
done

# Step 3: Expand to include transitive dependents
AFFECTED="$DIRECTLY_CHANGED"

for changed_pkg in $DIRECTLY_CHANGED; do
  deps="${DEPENDENTS[$changed_pkg]:-}"
  if [ -n "$deps" ]; then
    AFFECTED="$AFFECTED $deps"
  fi
done

# Deduplicate
AFFECTED=$(echo "$AFFECTED" | tr ' ' '\n' | sort -u)

echo "Affected packages (including dependents):"
for pkg in $AFFECTED; do
  if echo "$DIRECTLY_CHANGED" | grep -qw "$pkg"; then
    echo "  - $pkg (changed)"
  else
    echo "  - $pkg (depends on changed package)"
  fi
done
echo ""

# Step 4: Run tests only for affected packages
echo "=== Running tests for affected packages ==="
START=$(date +%s)

PIDS=()
PKG_NAMES=()
TMPDIR_BASE=$(mktemp -d)

for pkg in $AFFECTED; do
  PKG_DIR="packages/$pkg"
  if [ -d "$PKG_DIR/test" ]; then
    PKG_NAMES+=("$pkg")
    LOG="$TMPDIR_BASE/$pkg.log"
    (
      cd "$PKG_DIR"
      PKG_START=$(date +%s)
      if flutter test 2>&1 > "$LOG"; then
        PKG_END=$(date +%s)
        echo "PASS:$pkg:$((PKG_END - PKG_START))" >> "$TMPDIR_BASE/results.txt"
      else
        PKG_END=$(date +%s)
        echo "FAIL:$pkg:$((PKG_END - PKG_START))" >> "$TMPDIR_BASE/results.txt"
      fi
    ) &
    PIDS+=($!)
  fi
done

FAILED=0
for pid in "${PIDS[@]}"; do
  if ! wait "$pid"; then
    FAILED=1
  fi
done

END=$(date +%s)
ELAPSED=$((END - START))

echo ""
echo "=== Results ==="
if [ -f "$TMPDIR_BASE/results.txt" ]; then
  while IFS=: read -r status name duration; do
    if [ "$status" = "PASS" ]; then
      echo "  ✓ $name (${duration}s)"
    else
      echo "  ✗ $name FAILED (${duration}s)"
    fi
  done < "$TMPDIR_BASE/results.txt"
fi

SKIPPED_COUNT=0
for pkg_dir in packages/*/; do
  pkg_name=$(basename "$pkg_dir")
  if ! echo "$AFFECTED" | grep -qw "$pkg_name"; then
    SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
  fi
done

echo ""
echo "Tested: $(echo "$AFFECTED" | wc -w | tr -d ' ') packages"
echo "Skipped: $SKIPPED_COUNT packages (unchanged, no dependents affected)"
echo "Time: ${ELAPSED}s"

rm -rf "$TMPDIR_BASE"
exit $FAILED

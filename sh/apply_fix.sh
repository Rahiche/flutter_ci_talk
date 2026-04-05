#!/usr/bin/env bash
set -euo pipefail

# Apply a solution fix from the solutions/ directory
# Usage: sh/apply_fix.sh <fix_name>
# Example: sh/apply_fix.sh act2_fix_async

FIX_NAME="${1:-}"

if [ -z "$FIX_NAME" ]; then
  echo "Usage: sh/apply_fix.sh <fix_name>"
  echo ""
  echo "Available fixes:"
  for dir in solutions/*/; do
    echo "  $(basename "$dir")"
  done
  exit 1
fi

FIX_DIR="solutions/$FIX_NAME"

if [ ! -d "$FIX_DIR" ]; then
  echo "Error: Fix directory '$FIX_DIR' not found"
  exit 1
fi

echo "Applying fix: $FIX_NAME"
cp -r "$FIX_DIR"/* packages/
echo "Done! Fix applied."

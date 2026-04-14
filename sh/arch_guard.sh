#!/usr/bin/env bash
set -euo pipefail

# Package architecture guard.
# Detects circular dependencies and reports blast radius.
#
# Usage:
#   sh/arch_guard.sh
#   sh/arch_guard.sh --base main --max-affected 2 --max-blast-radius 2

if [ "$#" -eq 0 ]; then
  dart run tool/check_package_structure.dart --base main
else
  dart run tool/check_package_structure.dart "$@"
fi
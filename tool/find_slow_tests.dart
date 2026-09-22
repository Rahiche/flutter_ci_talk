#!/usr/bin/env dart
// Thin wrapper so the command in the talk keeps working:
//
//   dart run tool/find_slow_tests.dart packages
//
// The implementation lives in packages/test_bundler so it can be installed
// on its own:  dart pub global activate test_bundler && find-slow-tests
import 'package:test_bundler/find_slow_tests.dart';

void main(List<String> args) => run(args);

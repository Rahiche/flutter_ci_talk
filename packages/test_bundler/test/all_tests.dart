// GENERATED — do not edit by hand.
// Single-isolate test wrapper for test_bundler
// Run: flutter test test/all_tests.dart

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'generator_test.dart' as test_0;

void main() {
  void resetTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Reset screen size
    final binding = TestWidgetsFlutterBinding.instance;
    binding.platformDispatcher.clearAllTestValues();
  }

  group('generator_test.dart', () {
    setUp(() => resetTestEnvironment());
    test_0.main();
  });

}

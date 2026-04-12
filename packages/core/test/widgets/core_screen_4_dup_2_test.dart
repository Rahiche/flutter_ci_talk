import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/core_screen_4.dart';

void main() {
  group('CoreScreen4', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen4()))));
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen4), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen4()))));
      for (int j = 0; j < 100; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(CoreScreen4), findsOneWidget);
    });
  });
}

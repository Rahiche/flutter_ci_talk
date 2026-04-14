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
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen4), findsOneWidget);
    });
  });
}

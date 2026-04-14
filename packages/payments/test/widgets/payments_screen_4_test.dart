import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payments_screen_4.dart';

void main() {
  group('PaymentsScreen4', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen4()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen4), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen4()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen4), findsOneWidget);
    });
  });
}

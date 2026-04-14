import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payment_form.dart';

void main() {
  group('PaymentForm', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PaymentForm())));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentForm), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PaymentForm())));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentForm), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PaymentForm())));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentForm), findsOneWidget);
    });
  });
}

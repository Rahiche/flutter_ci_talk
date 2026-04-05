import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payment_history.dart';

void main() {
  group('PaymentHistory', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PaymentHistory())));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentHistory), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PaymentHistory())));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentHistory), findsOneWidget);
    });
  });
}

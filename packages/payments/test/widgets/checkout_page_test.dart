import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/checkout_page.dart';

void main() {
  group('CheckoutPage', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CheckoutPage())));
      await tester.pumpAndSettle();
      expect(find.byType(CheckoutPage), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CheckoutPage())));
      await tester.pumpAndSettle();
      expect(find.byType(CheckoutPage), findsOneWidget);
    });
  });
}

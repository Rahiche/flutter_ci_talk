import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/invoice_card.dart';

void main() {
  group('InvoiceCard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: InvoiceCard())));
      await tester.pumpAndSettle();
      expect(find.byType(InvoiceCard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: InvoiceCard())));
      await tester.pumpAndSettle();
      expect(find.byType(InvoiceCard), findsOneWidget);
    });
  });
}

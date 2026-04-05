import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/receipt_view.dart';

void main() {
  group('ReceiptView', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ReceiptView())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ReceiptView), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ReceiptView())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ReceiptView), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/transaction_list.dart';

void main() {
  group('TransactionList', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: TransactionList())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(TransactionList), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: TransactionList())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(TransactionList), findsOneWidget);
    });
  });
}

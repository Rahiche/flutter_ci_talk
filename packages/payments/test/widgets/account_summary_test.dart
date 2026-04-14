import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/account_summary.dart';

void main() {
  group('AccountSummary', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AccountSummary())));
      await tester.pumpAndSettle();
      expect(find.byType(AccountSummary), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AccountSummary())));
      await tester.pumpAndSettle();
      expect(find.byType(AccountSummary), findsOneWidget);
    });
  });
}

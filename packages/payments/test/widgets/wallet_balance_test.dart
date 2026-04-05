import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/wallet_balance.dart';

void main() {
  group('WalletBalance', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: WalletBalance())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(WalletBalance), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: WalletBalance())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(WalletBalance), findsOneWidget);
    });
  });
}

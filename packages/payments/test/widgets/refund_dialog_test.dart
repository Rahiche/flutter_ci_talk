import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/refund_dialog.dart';

void main() {
  group('RefundDialog', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: RefundDialog())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(RefundDialog), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: RefundDialog())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(RefundDialog), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: RefundDialog())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(RefundDialog), findsOneWidget);
    });
  });
}

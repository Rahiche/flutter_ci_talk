import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payments_screen_0.dart';

void main() {
  group('PaymentsScreen0', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen0()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen0), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen0()))));
      for (int j = 0; j < 100; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(PaymentsScreen0), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payments_screen_3.dart';

void main() {
  group('PaymentsScreen3', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen3()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen3), findsOneWidget);
    });
  });
}

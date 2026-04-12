import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payments_screen_1.dart';

void main() {
  group('PaymentsScreen1', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen1()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen1), findsOneWidget);
    });
  });
}

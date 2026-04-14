import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/payments_screen_2.dart';

void main() {
  group('PaymentsScreen2', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen2), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: PaymentsScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(PaymentsScreen2), findsOneWidget);
    });
  });
}

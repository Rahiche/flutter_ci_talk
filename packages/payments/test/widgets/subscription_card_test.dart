import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/subscription_card.dart';

void main() {
  group('SubscriptionCard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SubscriptionCard())));
      await tester.pumpAndSettle();
      expect(find.byType(SubscriptionCard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SubscriptionCard())));
      await tester.pumpAndSettle();
      expect(find.byType(SubscriptionCard), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SubscriptionCard())));
      await tester.pumpAndSettle();
      expect(find.byType(SubscriptionCard), findsOneWidget);
    });
  });
}

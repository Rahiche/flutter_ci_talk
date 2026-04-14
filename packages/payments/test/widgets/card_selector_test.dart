import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payments/src/widgets/card_selector.dart';

void main() {
  group('CardSelector', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CardSelector())));
      await tester.pumpAndSettle();
      expect(find.byType(CardSelector), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CardSelector())));
      await tester.pumpAndSettle();
      expect(find.byType(CardSelector), findsOneWidget);
    });
  });
}

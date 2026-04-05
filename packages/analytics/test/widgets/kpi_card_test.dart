import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/kpi_card.dart';

void main() {
  group('KpiCard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: KpiCard())));
      await tester.pumpAndSettle();
      expect(find.byType(KpiCard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: KpiCard())));
      await tester.pumpAndSettle();
      expect(find.byType(KpiCard), findsOneWidget);
    });
  });
}

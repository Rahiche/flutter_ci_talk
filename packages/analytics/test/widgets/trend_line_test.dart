import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/trend_line.dart';

void main() {
  group('TrendLine', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: TrendLine())));
      await tester.pumpAndSettle();
      expect(find.byType(TrendLine), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: TrendLine())));
      await tester.pumpAndSettle();
      expect(find.byType(TrendLine), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/metric_chart.dart';

void main() {
  group('MetricChart', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: MetricChart())));
      await tester.pumpAndSettle();
      expect(find.byType(MetricChart), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: MetricChart())));
      await tester.pumpAndSettle();
      expect(find.byType(MetricChart), findsOneWidget);
    });
  });
}

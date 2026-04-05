import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/analytics_dashboard.dart';

void main() {
  group('AnalyticsDashboard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AnalyticsDashboard())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(AnalyticsDashboard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AnalyticsDashboard())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(AnalyticsDashboard), findsOneWidget);
    });
  });
}

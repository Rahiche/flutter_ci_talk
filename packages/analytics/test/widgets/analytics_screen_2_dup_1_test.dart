import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/analytics_screen_2.dart';

void main() {
  group('AnalyticsScreen2', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(AnalyticsScreen2), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen2()))));
      for (int j = 0; j < 100; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(AnalyticsScreen2), findsOneWidget);
    });
  });
}

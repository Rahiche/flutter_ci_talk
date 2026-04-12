import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/analytics_screen_0.dart';

void main() {
  group('AnalyticsScreen0', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen0()))));
      await tester.pumpAndSettle();
      expect(find.byType(AnalyticsScreen0), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen0()))));
      for (int j = 0; j < 100; j++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(AnalyticsScreen0), findsOneWidget);
    });
  });
}

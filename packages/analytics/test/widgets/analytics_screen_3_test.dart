import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/analytics_screen_3.dart';

void main() {
  group('AnalyticsScreen3', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen3()))));
      await tester.pumpAndSettle();
      expect(find.byType(AnalyticsScreen3), findsOneWidget);
    });
  });
}

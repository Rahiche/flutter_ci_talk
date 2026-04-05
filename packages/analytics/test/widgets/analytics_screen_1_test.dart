import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/analytics_screen_1.dart';

void main() {
  group('AnalyticsScreen1', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AnalyticsScreen1()))));
      await tester.pumpAndSettle();
      expect(find.byType(AnalyticsScreen1), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/conversion_funnel.dart';

void main() {
  group('ConversionFunnel', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ConversionFunnel())));
      await tester.pumpAndSettle();
      expect(find.byType(ConversionFunnel), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ConversionFunnel())));
      await tester.pumpAndSettle();
      expect(find.byType(ConversionFunnel), findsOneWidget);
    });
  });
}

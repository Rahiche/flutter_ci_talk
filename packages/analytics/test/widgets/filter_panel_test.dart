import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/filter_panel.dart';

void main() {
  group('FilterPanel', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: FilterPanel())));
      await tester.pumpAndSettle();
      expect(find.byType(FilterPanel), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: FilterPanel())));
      await tester.pumpAndSettle();
      expect(find.byType(FilterPanel), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: FilterPanel())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(FilterPanel), findsOneWidget);
    });
  });
}

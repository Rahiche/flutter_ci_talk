import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/app_search_field.dart';

void main() {
  group('AppSearchField', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppSearchField())));
      await tester.pumpAndSettle();
      expect(find.byType(AppSearchField), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppSearchField())));
      await tester.pumpAndSettle();
      expect(find.byType(AppSearchField), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppSearchField())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(AppSearchField), findsOneWidget);
    });
  });
}

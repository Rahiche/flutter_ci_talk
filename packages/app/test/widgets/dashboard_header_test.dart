import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/dashboard_header.dart';

void main() {
  group('DashboardHeader', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DashboardHeader())));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardHeader), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DashboardHeader())));
      await tester.pumpAndSettle();
      expect(find.byType(DashboardHeader), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DashboardHeader())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(DashboardHeader), findsOneWidget);
    });
  });
}

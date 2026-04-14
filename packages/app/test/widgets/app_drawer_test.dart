import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/app_drawer.dart';

void main() {
  group('AppDrawer', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppDrawer())));
      await tester.pumpAndSettle();
      expect(find.byType(AppDrawer), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: AppDrawer())));
      await tester.pumpAndSettle();
      expect(find.byType(AppDrawer), findsOneWidget);
    });
  });
}

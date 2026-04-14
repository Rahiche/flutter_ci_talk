import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/bottom_nav_bar.dart';

void main() {
  group('BottomNavBar', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: BottomNavBar())));
      await tester.pumpAndSettle();
      expect(find.byType(BottomNavBar), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: BottomNavBar())));
      await tester.pumpAndSettle();
      expect(find.byType(BottomNavBar), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/badge_icon.dart';

void main() {
  group('BadgeIcon', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: BadgeIcon())));
      await tester.pumpAndSettle();
      expect(find.byType(BadgeIcon), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: BadgeIcon())));
      await tester.pumpAndSettle();
      expect(find.byType(BadgeIcon), findsOneWidget);
    });
  });
}

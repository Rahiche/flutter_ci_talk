import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/profile_card.dart';

void main() {
  group('ProfileCard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProfileCard())));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileCard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProfileCard())));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileCard), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProfileCard())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(ProfileCard), findsOneWidget);
    });
  });
}

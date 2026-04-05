import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/onboarding_page.dart';

void main() {
  group('OnboardingPage', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: OnboardingPage())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(OnboardingPage), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: OnboardingPage())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(OnboardingPage), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: OnboardingPage())));
      await tester.pumpAndSettle();
      expect(find.byType(OnboardingPage), findsOneWidget);
    });
  });
}

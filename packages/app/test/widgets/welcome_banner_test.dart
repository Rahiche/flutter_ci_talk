import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/welcome_banner.dart';

void main() {
  group('WelcomeBanner', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: WelcomeBanner())));
      await tester.pumpAndSettle();
      expect(find.byType(WelcomeBanner), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: WelcomeBanner())));
      await tester.pumpAndSettle();
      expect(find.byType(WelcomeBanner), findsOneWidget);
    });
  });
}

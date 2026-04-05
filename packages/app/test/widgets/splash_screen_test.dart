import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/splash_screen.dart';

void main() {
  group('SplashScreen', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SplashScreen())));
      await tester.pumpAndSettle();
      expect(find.byType(SplashScreen), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SplashScreen())));
      await tester.pumpAndSettle();
      expect(find.byType(SplashScreen), findsOneWidget);
    });
  });
}

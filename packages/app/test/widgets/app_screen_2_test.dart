import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/app_screen_2.dart';

void main() {
  group('AppScreen2', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AppScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(AppScreen2), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AppScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(AppScreen2), findsOneWidget);
    });
  });
}

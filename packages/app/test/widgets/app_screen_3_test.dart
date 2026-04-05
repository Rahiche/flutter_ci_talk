import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/app_screen_3.dart';

void main() {
  group('AppScreen3', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AppScreen3()))));
      await tester.pumpAndSettle();
      expect(find.byType(AppScreen3), findsOneWidget);
    });
  });
}

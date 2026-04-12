import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/app_screen_1.dart';

void main() {
  group('AppScreen1', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: AppScreen1()))));
      await tester.pumpAndSettle();
      expect(find.byType(AppScreen1), findsOneWidget);
    });
  });
}

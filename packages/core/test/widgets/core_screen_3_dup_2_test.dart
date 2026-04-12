import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/core_screen_3.dart';

void main() {
  group('CoreScreen3', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen3()))));
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen3), findsOneWidget);
    });
  });
}

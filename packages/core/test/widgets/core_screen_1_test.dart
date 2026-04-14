import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/core_screen_1.dart';

void main() {
  group('CoreScreen1', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen1()))));
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen1), findsOneWidget);
    });
  });
}

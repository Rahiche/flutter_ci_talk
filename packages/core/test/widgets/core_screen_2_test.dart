import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/core_screen_2.dart';

void main() {
  group('CoreScreen2', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen2), findsOneWidget);
    });
    testWidgets('stress renders', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SingleChildScrollView(child: CoreScreen2()))));
      await tester.pumpAndSettle();
      expect(find.byType(CoreScreen2), findsOneWidget);
    });
  });
}

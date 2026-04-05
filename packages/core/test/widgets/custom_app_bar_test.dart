import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/custom_app_bar.dart';

void main() {
  group('CustomAppBar', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CustomAppBar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(CustomAppBar), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: CustomAppBar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(CustomAppBar), findsOneWidget);
    });
  });
}

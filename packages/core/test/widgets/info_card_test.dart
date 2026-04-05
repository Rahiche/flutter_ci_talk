import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/info_card.dart';

void main() {
  group('InfoCard', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: InfoCard())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(InfoCard), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: InfoCard())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(InfoCard), findsOneWidget);
    });
  });
}

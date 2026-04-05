import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/export_button.dart';

void main() {
  group('ExportButton', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ExportButton())));
      await tester.pumpAndSettle();
      expect(find.byType(ExportButton), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ExportButton())));
      await tester.pumpAndSettle();
      expect(find.byType(ExportButton), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/confirm_dialog.dart';

void main() {
  group('ConfirmDialog', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ConfirmDialog())));
      await tester.pumpAndSettle();
      expect(find.byType(ConfirmDialog), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ConfirmDialog())));
      await tester.pumpAndSettle();
      expect(find.byType(ConfirmDialog), findsOneWidget);
    });
  });
}

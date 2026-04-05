import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/error_display.dart';

void main() {
  group('ErrorDisplay', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ErrorDisplay())));
      await tester.pumpAndSettle();
      expect(find.byType(ErrorDisplay), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ErrorDisplay())));
      await tester.pumpAndSettle();
      expect(find.byType(ErrorDisplay), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ErrorDisplay())));
      for (int i = 0; i < 120; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(find.byType(ErrorDisplay), findsOneWidget);
    });
  });
}

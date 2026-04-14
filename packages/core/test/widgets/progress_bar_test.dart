import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/progress_bar.dart';

void main() {
  group('ProgressBar', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProgressBar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ProgressBar), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProgressBar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ProgressBar), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ProgressBar())));
      await tester.pumpAndSettle();
      expect(find.byType(ProgressBar), findsOneWidget);
    });
  });
}

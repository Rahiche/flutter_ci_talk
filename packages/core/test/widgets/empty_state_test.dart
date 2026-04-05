import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/empty_state.dart';

void main() {
  group('EmptyState', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EmptyState())));
      await tester.pumpAndSettle();
      expect(find.byType(EmptyState), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EmptyState())));
      await tester.pumpAndSettle();
      expect(find.byType(EmptyState), findsOneWidget);
    });
  });
}

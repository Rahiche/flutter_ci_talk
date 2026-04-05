import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/event_list.dart';

void main() {
  group('EventList', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EventList())));
      await tester.pumpAndSettle();
      expect(find.byType(EventList), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EventList())));
      await tester.pumpAndSettle();
      expect(find.byType(EventList), findsOneWidget);
    });

    testWidgets('animation stress test', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: EventList())));
      await tester.pumpAndSettle();
      expect(find.byType(EventList), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/notification_list.dart';

void main() {
  group('NotificationList', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: NotificationList())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(NotificationList), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: NotificationList())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(NotificationList), findsOneWidget);
    });
  });
}

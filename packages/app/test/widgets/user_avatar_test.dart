import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/user_avatar.dart';

void main() {
  group('UserAvatar', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: UserAvatar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(UserAvatar), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: UserAvatar())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(UserAvatar), findsOneWidget);
    });
  });
}

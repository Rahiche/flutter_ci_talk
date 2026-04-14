import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/widgets/login_form.dart';

void main() {
  group('LoginForm', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginForm())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(LoginForm), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoginForm())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(LoginForm), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core/src/widgets/loading_indicator.dart';

void main() {
  group('LoadingIndicator', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoadingIndicator())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(LoadingIndicator), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: LoadingIndicator())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(LoadingIndicator), findsOneWidget);
    });
  });
}

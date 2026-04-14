import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/date_range_picker.dart';

void main() {
  group('DateRangePicker', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DateRangePicker())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(DateRangePicker), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: DateRangePicker())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(DateRangePicker), findsOneWidget);
    });
  });
}

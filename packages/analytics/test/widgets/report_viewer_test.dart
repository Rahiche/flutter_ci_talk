import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:analytics/src/widgets/report_viewer.dart';

void main() {
  group('ReportViewer', () {
    testWidgets('renders without error', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ReportViewer())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ReportViewer), findsOneWidget);
    });
    testWidgets('builds correctly', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ReportViewer())));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byType(ReportViewer), findsOneWidget);
    });
  });
}

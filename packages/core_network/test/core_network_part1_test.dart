import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:core_network/core_network.dart';

void main() {
  group('CoreNetwork part 1', () {
    late CoreNetworkService service;
    late List<CoreNetworkItem> fixture;

    setUp(() {
      service = CoreNetworkService();
      fixture = List.generate(
        400,
        (i) => CoreNetworkItem(id: '$i', label: 'row $i', amount: i),
      );
      fixture = service.sorted(fixture);
      for (final item in fixture.take(120)) {
        CoreNetworkItem.fromJson(item.toJson());
      }
    });

    testWidgets('renders list 1', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 2', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 3', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 4', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 5', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 6', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 7', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 8', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 9', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 10', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 11', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 12', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 13', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 14', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 15', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 16', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 17', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 18', (tester) async {
      final state = CoreNetworkState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: CoreNetworkListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(CoreNetworkTile), findsWidgets);
      await tester.tap(find.byType(CoreNetworkTile).first);
      await tester.pumpAndSettle();
    });

    test('service loads', () async {
      final items = await service.load();
      expect(items, hasLength(40));
    });

    test('service refreshes', () async {
      final state = await service.refresh();
      expect(state.total, greaterThan(0));
    });
  });
}

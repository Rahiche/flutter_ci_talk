import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chat/chat.dart';

void main() {
  group('Chat part 1', () {
    late ChatService service;
    late List<ChatItem> fixture;

    setUp(() {
      service = ChatService();
      fixture = List.generate(
        400,
        (i) => ChatItem(id: '$i', label: 'row $i', amount: i),
      );
      fixture = service.sorted(fixture);
      for (final item in fixture.take(120)) {
        ChatItem.fromJson(item.toJson());
      }
    });

    testWidgets('renders list 1', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 2', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 3', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 4', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 5', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 6', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 7', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 8', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 9', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 10', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 11', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 12', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 13', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 14', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 15', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 16', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 17', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
      await tester.pumpAndSettle();
    });

    testWidgets('renders list 18', (tester) async {
      final state = ChatState(items: fixture.take(30).toList());
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: ChatListView(state: state)),
      ));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('total')), findsOneWidget);
      expect(find.byType(ChatTile), findsWidgets);
      await tester.tap(find.byType(ChatTile).first);
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

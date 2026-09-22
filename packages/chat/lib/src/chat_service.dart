import 'chat_models.dart';

class ChatService {
  ChatService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ChatItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ChatItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ChatState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ChatState(items: await load(count: count));
  }

  List<ChatItem> sorted(List<ChatItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

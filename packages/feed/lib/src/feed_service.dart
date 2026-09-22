import 'feed_models.dart';

class FeedService {
  FeedService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<FeedItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => FeedItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<FeedState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return FeedState(items: await load(count: count));
  }

  List<FeedItem> sorted(List<FeedItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

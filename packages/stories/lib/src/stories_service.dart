import 'stories_models.dart';

class StoriesService {
  StoriesService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<StoriesItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => StoriesItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<StoriesState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return StoriesState(items: await load(count: count));
  }

  List<StoriesItem> sorted(List<StoriesItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

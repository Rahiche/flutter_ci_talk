import 'ratings_models.dart';

class RatingsService {
  RatingsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<RatingsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => RatingsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<RatingsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return RatingsState(items: await load(count: count));
  }

  List<RatingsItem> sorted(List<RatingsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

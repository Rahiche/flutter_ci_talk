import 'search_api_models.dart';

class SearchApiService {
  SearchApiService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SearchApiItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SearchApiItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SearchApiState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SearchApiState(items: await load(count: count));
  }

  List<SearchApiItem> sorted(List<SearchApiItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

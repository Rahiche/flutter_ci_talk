import 'search_models.dart';

class SearchService {
  SearchService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SearchItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SearchItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SearchState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SearchState(items: await load(count: count));
  }

  List<SearchItem> sorted(List<SearchItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

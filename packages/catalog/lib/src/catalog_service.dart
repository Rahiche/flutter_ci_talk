import 'catalog_models.dart';

class CatalogService {
  CatalogService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CatalogItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CatalogItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CatalogState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CatalogState(items: await load(count: count));
  }

  List<CatalogItem> sorted(List<CatalogItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

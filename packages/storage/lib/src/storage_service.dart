import 'storage_models.dart';

class StorageService {
  StorageService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<StorageItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => StorageItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<StorageState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return StorageState(items: await load(count: count));
  }

  List<StorageItem> sorted(List<StorageItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

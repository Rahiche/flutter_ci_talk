import 'core_data_models.dart';

class CoreDataService {
  CoreDataService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CoreDataItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CoreDataItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CoreDataState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CoreDataState(items: await load(count: count));
  }

  List<CoreDataItem> sorted(List<CoreDataItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

import 'core_utils_models.dart';

class CoreUtilsService {
  CoreUtilsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CoreUtilsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CoreUtilsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CoreUtilsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CoreUtilsState(items: await load(count: count));
  }

  List<CoreUtilsItem> sorted(List<CoreUtilsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

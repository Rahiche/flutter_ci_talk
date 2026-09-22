import 'core_ui_models.dart';

class CoreUiService {
  CoreUiService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CoreUiItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CoreUiItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CoreUiState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CoreUiState(items: await load(count: count));
  }

  List<CoreUiItem> sorted(List<CoreUiItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

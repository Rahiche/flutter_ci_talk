import 'design_system_models.dart';

class DesignSystemService {
  DesignSystemService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<DesignSystemItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => DesignSystemItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<DesignSystemState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return DesignSystemState(items: await load(count: count));
  }

  List<DesignSystemItem> sorted(List<DesignSystemItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

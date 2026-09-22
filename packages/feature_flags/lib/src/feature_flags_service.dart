import 'feature_flags_models.dart';

class FeatureFlagsService {
  FeatureFlagsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<FeatureFlagsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => FeatureFlagsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<FeatureFlagsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return FeatureFlagsState(items: await load(count: count));
  }

  List<FeatureFlagsItem> sorted(List<FeatureFlagsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

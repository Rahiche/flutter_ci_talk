import 'core_network_models.dart';

class CoreNetworkService {
  CoreNetworkService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CoreNetworkItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CoreNetworkItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CoreNetworkState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CoreNetworkState(items: await load(count: count));
  }

  List<CoreNetworkItem> sorted(List<CoreNetworkItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

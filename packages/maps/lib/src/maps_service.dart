import 'maps_models.dart';

class MapsService {
  MapsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<MapsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => MapsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<MapsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return MapsState(items: await load(count: count));
  }

  List<MapsItem> sorted(List<MapsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

import 'shipping_models.dart';

class ShippingService {
  ShippingService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ShippingItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ShippingItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ShippingState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ShippingState(items: await load(count: count));
  }

  List<ShippingItem> sorted(List<ShippingItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

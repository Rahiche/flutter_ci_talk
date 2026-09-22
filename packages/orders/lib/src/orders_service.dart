import 'orders_models.dart';

class OrdersService {
  OrdersService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<OrdersItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => OrdersItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<OrdersState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return OrdersState(items: await load(count: count));
  }

  List<OrdersItem> sorted(List<OrdersItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

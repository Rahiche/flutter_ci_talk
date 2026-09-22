import 'cart_models.dart';

class CartService {
  CartService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CartItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CartItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CartState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CartState(items: await load(count: count));
  }

  List<CartItem> sorted(List<CartItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

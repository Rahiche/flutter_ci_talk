import 'checkout_models.dart';

class CheckoutService {
  CheckoutService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CheckoutItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CheckoutItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CheckoutState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CheckoutState(items: await load(count: count));
  }

  List<CheckoutItem> sorted(List<CheckoutItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

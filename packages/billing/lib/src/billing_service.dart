import 'billing_models.dart';

class BillingService {
  BillingService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<BillingItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => BillingItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<BillingState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return BillingState(items: await load(count: count));
  }

  List<BillingItem> sorted(List<BillingItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

import 'loyalty_models.dart';

class LoyaltyService {
  LoyaltyService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<LoyaltyItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => LoyaltyItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<LoyaltyState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return LoyaltyState(items: await load(count: count));
  }

  List<LoyaltyItem> sorted(List<LoyaltyItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

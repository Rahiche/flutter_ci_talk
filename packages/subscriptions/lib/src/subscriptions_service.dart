import 'subscriptions_models.dart';

class SubscriptionsService {
  SubscriptionsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SubscriptionsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SubscriptionsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SubscriptionsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SubscriptionsState(items: await load(count: count));
  }

  List<SubscriptionsItem> sorted(List<SubscriptionsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

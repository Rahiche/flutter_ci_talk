import 'referrals_models.dart';

class ReferralsService {
  ReferralsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ReferralsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ReferralsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ReferralsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ReferralsState(items: await load(count: count));
  }

  List<ReferralsItem> sorted(List<ReferralsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

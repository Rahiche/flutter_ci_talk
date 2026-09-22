import 'l10n_models.dart';

class L10nService {
  L10nService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<L10nItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => L10nItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<L10nState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return L10nState(items: await load(count: count));
  }

  List<L10nItem> sorted(List<L10nItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

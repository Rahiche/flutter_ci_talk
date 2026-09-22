import 'support_models.dart';

class SupportService {
  SupportService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SupportItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SupportItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SupportState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SupportState(items: await load(count: count));
  }

  List<SupportItem> sorted(List<SupportItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

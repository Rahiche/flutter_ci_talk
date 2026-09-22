import 'receipts_models.dart';

class ReceiptsService {
  ReceiptsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ReceiptsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ReceiptsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ReceiptsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ReceiptsState(items: await load(count: count));
  }

  List<ReceiptsItem> sorted(List<ReceiptsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

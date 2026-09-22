import 'invoices_models.dart';

class InvoicesService {
  InvoicesService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<InvoicesItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => InvoicesItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<InvoicesState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return InvoicesState(items: await load(count: count));
  }

  List<InvoicesItem> sorted(List<InvoicesItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

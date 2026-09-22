import 'vouchers_models.dart';

class VouchersService {
  VouchersService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<VouchersItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => VouchersItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<VouchersState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return VouchersState(items: await load(count: count));
  }

  List<VouchersItem> sorted(List<VouchersItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

import 'addresses_models.dart';

class AddressesService {
  AddressesService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<AddressesItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => AddressesItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<AddressesState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return AddressesState(items: await load(count: count));
  }

  List<AddressesItem> sorted(List<AddressesItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

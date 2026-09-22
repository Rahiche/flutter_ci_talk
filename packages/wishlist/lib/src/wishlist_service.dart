import 'wishlist_models.dart';

class WishlistService {
  WishlistService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<WishlistItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => WishlistItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<WishlistState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return WishlistState(items: await load(count: count));
  }

  List<WishlistItem> sorted(List<WishlistItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

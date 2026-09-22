import 'gallery_models.dart';

class GalleryService {
  GalleryService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<GalleryItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => GalleryItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<GalleryState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return GalleryState(items: await load(count: count));
  }

  List<GalleryItem> sorted(List<GalleryItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

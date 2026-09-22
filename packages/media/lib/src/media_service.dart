import 'media_models.dart';

class MediaService {
  MediaService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<MediaItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => MediaItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<MediaState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return MediaState(items: await load(count: count));
  }

  List<MediaItem> sorted(List<MediaItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

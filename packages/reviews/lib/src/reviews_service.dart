import 'reviews_models.dart';

class ReviewsService {
  ReviewsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ReviewsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ReviewsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ReviewsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ReviewsState(items: await load(count: count));
  }

  List<ReviewsItem> sorted(List<ReviewsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

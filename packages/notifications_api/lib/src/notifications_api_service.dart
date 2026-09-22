import 'notifications_api_models.dart';

class NotificationsApiService {
  NotificationsApiService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<NotificationsApiItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => NotificationsApiItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<NotificationsApiState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return NotificationsApiState(items: await load(count: count));
  }

  List<NotificationsApiItem> sorted(List<NotificationsApiItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

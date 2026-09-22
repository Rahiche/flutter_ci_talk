import 'notifications_models.dart';

class NotificationsService {
  NotificationsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<NotificationsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => NotificationsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<NotificationsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return NotificationsState(items: await load(count: count));
  }

  List<NotificationsItem> sorted(List<NotificationsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

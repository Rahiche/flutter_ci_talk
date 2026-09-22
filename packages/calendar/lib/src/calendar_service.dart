import 'calendar_models.dart';

class CalendarService {
  CalendarService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<CalendarItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => CalendarItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<CalendarState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return CalendarState(items: await load(count: count));
  }

  List<CalendarItem> sorted(List<CalendarItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

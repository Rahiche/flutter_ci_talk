import 'analytics_events_models.dart';

class AnalyticsEventsService {
  AnalyticsEventsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<AnalyticsEventsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => AnalyticsEventsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<AnalyticsEventsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return AnalyticsEventsState(items: await load(count: count));
  }

  List<AnalyticsEventsItem> sorted(List<AnalyticsEventsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

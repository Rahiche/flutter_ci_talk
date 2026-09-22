import 'telemetry_models.dart';

class TelemetryService {
  TelemetryService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<TelemetryItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => TelemetryItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<TelemetryState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return TelemetryState(items: await load(count: count));
  }

  List<TelemetryItem> sorted(List<TelemetryItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

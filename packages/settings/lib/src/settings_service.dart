import 'settings_models.dart';

class SettingsService {
  SettingsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SettingsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SettingsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SettingsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SettingsState(items: await load(count: count));
  }

  List<SettingsItem> sorted(List<SettingsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

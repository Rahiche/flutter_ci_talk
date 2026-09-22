import 'app_strings_models.dart';

class AppStringsService {
  AppStringsService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<AppStringsItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => AppStringsItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<AppStringsState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return AppStringsState(items: await load(count: count));
  }

  List<AppStringsItem> sorted(List<AppStringsItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

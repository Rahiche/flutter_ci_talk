import 'onboarding_models.dart';

class OnboardingService {
  OnboardingService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<OnboardingItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => OnboardingItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<OnboardingState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return OnboardingState(items: await load(count: count));
  }

  List<OnboardingItem> sorted(List<OnboardingItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

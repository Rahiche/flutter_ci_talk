import 'profile_models.dart';

class ProfileService {
  ProfileService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<ProfileItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => ProfileItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<ProfileState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return ProfileState(items: await load(count: count));
  }

  List<ProfileItem> sorted(List<ProfileItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

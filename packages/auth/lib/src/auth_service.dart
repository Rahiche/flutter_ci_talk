import 'auth_models.dart';

class AuthService {
  AuthService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<AuthItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => AuthItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<AuthState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return AuthState(items: await load(count: count));
  }

  List<AuthItem> sorted(List<AuthItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

import 'session_models.dart';

class SessionService {
  SessionService({this.debounce = const Duration(milliseconds: 180)});

  final Duration debounce;

  Future<List<SessionItem>> load({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return List.generate(
      count,
      (i) => SessionItem(id: '$i', label: 'item $i', amount: i * 3),
    );
  }

  Future<SessionState> refresh({int count = 40}) async {
    await Future<void>.delayed(debounce);
    return SessionState(items: await load(count: count));
  }

  List<SessionItem> sorted(List<SessionItem> input) {
    final copy = [...input]..sort((a, b) => a.amount.compareTo(b.amount));
    return copy;
  }
}

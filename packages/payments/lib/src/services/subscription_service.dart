class SubscriptionService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 120));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 98));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 94));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 52));
    return true;
  }

}

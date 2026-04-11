class SubscriptionService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 42));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 34));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 32));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 18));
    return true;
  }

}

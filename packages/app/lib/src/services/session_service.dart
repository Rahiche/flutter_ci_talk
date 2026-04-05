class SessionService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 105));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 89));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 82));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 46));
    return true;
  }

}

class UserService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 95));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 83));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 74));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 42));
    return true;
  }

}

class AuthService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 90));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 80));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 70));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 40));
    return true;
  }

}

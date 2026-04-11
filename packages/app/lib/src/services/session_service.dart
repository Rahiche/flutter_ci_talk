class SessionService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 36));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 31));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 28));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 16));
    return true;
  }

}

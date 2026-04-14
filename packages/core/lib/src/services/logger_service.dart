class LoggerService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 86));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 78));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 44));
    return true;
  }

}

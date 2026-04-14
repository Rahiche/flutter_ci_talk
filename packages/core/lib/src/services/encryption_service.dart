class EncryptionService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 115));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 95));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 90));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

}

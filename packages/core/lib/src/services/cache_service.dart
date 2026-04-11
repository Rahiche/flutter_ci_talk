class CacheService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 33));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 29));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 25));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 14));
    return true;
  }

}

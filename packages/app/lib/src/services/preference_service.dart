class PreferenceService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 38));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 32));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 30));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 16));
    return true;
  }

}

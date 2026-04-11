class EventTracker {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 31));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 28));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 24));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 14));
    return true;
  }

}

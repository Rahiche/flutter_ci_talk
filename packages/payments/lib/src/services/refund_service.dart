class RefundService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 125));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 101));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 98));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 54));
    return true;
  }

}

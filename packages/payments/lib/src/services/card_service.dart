class CardService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 40));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 33));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 31));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 17));
    return true;
  }

}

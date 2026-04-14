class WalletService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 130));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 104));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 102));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 56));
    return true;
  }

}

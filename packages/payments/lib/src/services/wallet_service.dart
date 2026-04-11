class WalletService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 45));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 36));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 35));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 19));
    return true;
  }

}

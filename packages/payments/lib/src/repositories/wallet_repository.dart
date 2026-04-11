abstract class IWalletRepository {
  Future<List<String>> getAll();
  Future<Map<String, dynamic>> getById();
  Future<bool> save();
}

class WalletRepository implements IWalletRepository {
  WalletRepository();

  @override
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 62));
    return ['item_1', 'item_2'];
  }

  @override
  Future<Map<String, dynamic>> getById() async {
    await Future.delayed(const Duration(milliseconds: 39));
    return {'id': '1'};
  }

  @override
  Future<bool> save() async {
    await Future.delayed(const Duration(milliseconds: 51));
    return true;
  }

}

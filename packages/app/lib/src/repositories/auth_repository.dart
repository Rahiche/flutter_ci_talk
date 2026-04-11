abstract class IAuthRepository {
  Future<List<String>> getAll();
  Future<Map<String, dynamic>> getById();
  Future<bool> save();
}

class AuthRepository implements IAuthRepository {
  AuthRepository();

  @override
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 49));
    return ['item_1', 'item_2'];
  }

  @override
  Future<Map<String, dynamic>> getById() async {
    await Future.delayed(const Duration(milliseconds: 30));
    return {'id': '1'};
  }

  @override
  Future<bool> save() async {
    await Future.delayed(const Duration(milliseconds: 39));
    return true;
  }

}

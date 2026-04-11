abstract class IPreferenceRepository {
  Future<List<String>> getAll();
  Future<Map<String, dynamic>> getById();
  Future<bool> save();
}

class PreferenceRepository implements IPreferenceRepository {
  PreferenceRepository();

  @override
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 56));
    return ['item_1', 'item_2'];
  }

  @override
  Future<Map<String, dynamic>> getById() async {
    await Future.delayed(const Duration(milliseconds: 35));
    return {'id': '1'};
  }

  @override
  Future<bool> save() async {
    await Future.delayed(const Duration(milliseconds: 45));
    return true;
  }

}

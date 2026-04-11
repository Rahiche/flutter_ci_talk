abstract class IMetricsRepository {
  Future<List<String>> getAll();
  Future<Map<String, dynamic>> getById();
  Future<bool> save();
}

class MetricsRepository implements IMetricsRepository {
  MetricsRepository();

  @override
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return ['item_1', 'item_2'];
  }

  @override
  Future<Map<String, dynamic>> getById() async {
    await Future.delayed(const Duration(milliseconds: 31));
    return {'id': '1'};
  }

  @override
  Future<bool> save() async {
    await Future.delayed(const Duration(milliseconds: 41));
    return true;
  }

}

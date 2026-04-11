abstract class INotificationRepository {
  Future<List<String>> getAll();
  Future<Map<String, dynamic>> getById();
  Future<bool> save();
}

class NotificationRepository implements INotificationRepository {
  NotificationRepository();

  @override
  Future<List<String>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 52));
    return ['item_1', 'item_2'];
  }

  @override
  Future<Map<String, dynamic>> getById() async {
    await Future.delayed(const Duration(milliseconds: 32));
    return {'id': '1'};
  }

  @override
  Future<bool> save() async {
    await Future.delayed(const Duration(milliseconds: 42));
    return true;
  }

}

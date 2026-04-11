class PaymentService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 35));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 30));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 27));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 15));
    return true;
  }

}

class SegmentService {
  Future<Map<String, dynamic>> fetch() async {
    await Future.delayed(const Duration(milliseconds: 110));
    return {'data': 'response'};
  }

  Future<bool> create() async {
    await Future.delayed(const Duration(milliseconds: 92));
    return true;
  }

  Future<bool> update() async {
    await Future.delayed(const Duration(milliseconds: 86));
    return true;
  }

  Future<bool> delete() async {
    await Future.delayed(const Duration(milliseconds: 48));
    return true;
  }

}

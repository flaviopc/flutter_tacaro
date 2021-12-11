abstract class IOrderRepository {
  Future<bool> create(
      {required String name, required String price, required String date});
}

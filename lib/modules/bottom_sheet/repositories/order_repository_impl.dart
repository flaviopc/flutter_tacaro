import 'package:ta_caro/shared/services/app_database.dart';

import 'order_repository.dart';

class OrderRepositoryImpl implements IOrderRepository {
  final AppDatabase database;

  OrderRepositoryImpl({required this.database});

  @override
  Future<bool> create(
      {required String name,
      required String price,
      required String date}) async {
    final priceSanitize = double.parse(price.replaceAll("R\$", ""));
    final response = await database.create(
        table: "orders",
        data: {"name": name, "price": priceSanitize, "created": date});
    return response;
  }
}

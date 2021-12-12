import 'package:flutter/cupertino.dart';
import 'package:ta_caro/shared/models/order_model.dart';
import 'package:ta_caro/shared/models/product_model.dart';
import 'package:ta_caro/shared/utils/app_state.dart';

import 'repositories/feed_repository.dart';

class FeedController extends ChangeNotifier {
  final IFeedRepository repository;
  AppState appState = AppState.empty();

  FeedController({
    required this.repository,
  });

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }

  List<ProductModel> get products {
    final products = <ProductModel>[];
    for (var item in orders) {
      final product = ProductModel(
          name: item.name, lastPrice: item.price, currentPrice: 0.0);
      final index =
          products.indexWhere((element) => element.name == product.name);
      if (index != -1) {
        final currentProduct = products[index];
        products[index] = currentProduct.copyWith(currentPrice: item.price);
      } else {
        products.add(product);
      }
    }
    return products;
  }

  List<OrderModel> get orders =>
      appState.when(success: (value) => value, orElse: () => []);

  double get total {
    var sum = 0.0;
    for (var item in orders) sum += item.price;
    return sum;
  }

  double calcChart(List<ProductModel> products) {
    var up = 0.0;
    var down = 0.0;

    for (var item in products)
      if (item.currentPrice < item.lastPrice)
        up += 1;
      else
        down += 1;

    return down / up;
  }

  Future<void> getData() async {
    try {
      update(AppState.loading());
      final response = await repository.getAll();
      //print(response);
      update(AppState.success<List<OrderModel>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}

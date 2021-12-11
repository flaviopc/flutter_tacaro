import 'package:flutter/cupertino.dart';
import 'package:ta_caro/shared/models/order_model.dart';
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

  List<OrderModel> get orders =>
      appState.when(success: (value) => value, orElse: () => []);

  double get total {
    var sum = 0.0;
    for (var item in orders) sum += item.price;
    return sum;
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

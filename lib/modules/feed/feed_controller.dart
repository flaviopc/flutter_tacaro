import 'package:flutter/cupertino.dart';
import 'package:ta_caro/shared/utils/app_state.dart';

import 'repositories/feed_repository.dart';

class FeedController extends ChangeNotifier {
  final IFeedRepository repository;
  var appState = AppState.empty();

  FeedController({
    required this.repository,
  });

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }

  Future<void> getData() async {
    try {
      update(AppState.loading());
      final response = await repository.getAll();

      update(AppState.success<List<Map<String, dynamic>>>(response));
    } catch (e) {
      update(AppState.error(e.toString()));
    }
  }
}

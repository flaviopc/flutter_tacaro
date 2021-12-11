import 'package:flutter/cupertino.dart';

import 'package:ta_caro/shared/utils/app_state.dart';

import 'repositories/order_repository.dart';

class BottomSheetController extends ChangeNotifier {
  final IOrderRepository repository;
  var appState = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _date = "";

  BottomSheetController({
    required this.repository,
  });

  void onChange({String? name, String? price, String? date}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.appState = state;
    notifyListeners();
  }

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response =
            await repository.create(name: _name, price: _price, date: _date);
        if (response)
          update(AppState.success<bool>(response));
        else
          throw Exception("Não foi possivel salvar");
      } catch (e) {
        update(AppState.error(e.toString()));
      }
    }
  }
}

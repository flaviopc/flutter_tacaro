import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/repositories/login_repository.dart';
import 'package:ta_caro/shared/utils/app_state.dart';
import 'package:validators/validators.dart';

class CreateAccountController extends ChangeNotifier {
  final LoginRepository repository;
  AppState appState = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

  CreateAccountController({required this.repository});

  void onChange({String? name, String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
    _name = name ?? _name;
  }

  String? validaEmail(value) =>
      isEmail(value) ? null : "Informe um e-mail válido!";

  String? validaName(value) => value.isNotEmpty ? null : "Nome muito curto";

  String? validaSenha(value) =>
      value.length >= 6 ? null : "Senha muito pequena";

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
        await repository.createAccount(
            name: _name, email: _email, password: _password);
        update(AppState.success<String>("Criado"));
      } catch (e) {
        update(AppState.error("Não foi possivel criar"));
      }
    }
  }
}

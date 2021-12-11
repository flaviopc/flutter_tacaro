import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/repositories/login_repository.dart';
import 'package:ta_caro/shared/utils/app_state.dart';
import 'package:validators/validators.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository repository;
  var appState = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

  LoginController({required this.repository});

  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  String? validaEmail(value) =>
      isEmail(value) ? null : "Informe um e-mail válido!";

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

  Future<void> login() async {
    if (validate()) {
      try {
        update(AppState.loading());
        await repository.login(email: _email, password: _password);
        update(AppState.success<String>("Logado"));
      } catch (e) {
        update(AppState.error("Erro ao fazer login"));
      }
    }
  }
}

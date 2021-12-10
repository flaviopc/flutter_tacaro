import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";

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

  void login() {
    if (validate()) {}
  }
}

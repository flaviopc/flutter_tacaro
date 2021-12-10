import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class CreateAccountController {
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

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

  void create() {
    if (validate()) {}
  }
}

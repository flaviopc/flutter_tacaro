import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_controller.dart';

import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                ),
                InputText(
                  label: "E-mail",
                  hint: "Informe seu e-mail",
                  validator: (value) => controller.validaEmail(value),
                  onChanged: (value) => controller.onChange(email: value),
                ),
                SizedBox(height: 18),
                InputText(
                  label: "Senha",
                  hint: "Informe sua senha",
                  validator: (value) => controller.validaSenha(value),
                  obscure: true,
                  onChanged: (value) => controller.onChange(password: value),
                ),
                SizedBox(height: 18),
                Button(
                  label: "Entrar",
                  type: ButtonType.fill,
                  onTap: () => controller.login(),
                ),
                SizedBox(height: 30),
                Button(
                  label: "Criar conta",
                  type: ButtonType.outline,
                  onTap: () =>
                      Navigator.pushNamed(context, "/login/create-account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
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
            ),
            SizedBox(height: 18),
            InputText(
              label: "Senha",
              hint: "Informe sua senha",
            ),
            SizedBox(height: 18),
            Button(
              label: "Entrar",
              type: ButtonType.fill,
            ),
            SizedBox(height: 30),
            Button(
              label: "Criar conta",
              type: ButtonType.outline,
            ),
          ],
        ),
      ),
    );
  }
}

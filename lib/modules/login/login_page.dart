import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/login_controller.dart';
import 'package:ta_caro/modules/login/repositories/login_repository_impl.dart';
import 'package:ta_caro/shared/services/app_database.dart';

import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller = LoginController(
        repository: LoginRespositoryImpl(database: AppDatabase.instance));
    controller.addListener(() {
      controller.appState.when(
        success: (value) => Navigator.pushReplacementNamed(
          context,
          "/home",
          arguments: value,
        ),
        error: (message, _) =>
            scaffoldKey.currentState!.showBottomSheet((context) => Container(
                  height: 20,
                  child: Center(child: Text(message)),
                )),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                AnimatedBuilder(
                  animation: controller,
                  builder: (_, __) => controller.appState.when(
                    loading: () => CircularProgressIndicator(),
                    orElse: () => Column(
                      children: [
                        Button(
                          label: "Entrar",
                          type: ButtonType.fill,
                          onTap: () => controller.login(),
                        ),
                        SizedBox(height: 30),
                        Button(
                          label: "Criar conta",
                          type: ButtonType.outline,
                          onTap: () => Navigator.pushNamed(
                              context, "/login/create-account"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

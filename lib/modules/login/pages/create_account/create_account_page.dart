import 'package:flutter/material.dart';
import 'package:ta_caro/modules/login/pages/create_account/create_account_controller.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final controller = CreateAccountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        leading: BackButton(
          color: AppTheme.colors.backButton,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Criar conta",
                  style: AppTheme.textStyles.title,
                ),
                SizedBox(height: 10),
                Text(
                  "Mantenha seus gastos em dia",
                  style: AppTheme.textStyles.subtitle,
                ),
                SizedBox(height: 20),
                InputText(
                    label: "Nome",
                    hint: "Informe seu nome",
                    onChanged: (value) => controller.onChange(name: value),
                    validator: (value) => controller.validaName(value)),
                SizedBox(height: 18),
                InputText(
                    label: "E-mail",
                    hint: "Informe seu e-mail",
                    onChanged: (value) => controller.onChange(email: value),
                    validator: (value) => controller.validaEmail(value)),
                SizedBox(height: 18),
                InputText(
                  label: "Senha",
                  hint: "Informe sua senha",
                  obscure: true,
                  validator: (value) => controller.validaSenha(value),
                  onChanged: (value) => controller.onChange(password: value),
                ),
                SizedBox(height: 18),
                Button(
                  label: "Criar conta",
                  type: ButtonType.fill,
                  onTap: () => controller.create(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

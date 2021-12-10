import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_text_styles.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

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
              ),
              SizedBox(height: 18),
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
                label: "Criar conta",
                type: ButtonType.fill,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

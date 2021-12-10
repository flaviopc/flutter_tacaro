import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}

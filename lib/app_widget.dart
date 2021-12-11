import 'package:flutter/material.dart';
import 'package:ta_caro/modules/home/home_page.dart';
import 'package:ta_caro/shared/models/user_model.dart';
import 'modules/login/pages/create_account/create_account_page.dart';
import 'modules/splash/splash_page.dart';
import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/home",
      routes: {
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => HomePage()
        //  user: ModalRoute.of(context)?.settings.arguments as UserModel),
      },
    );
  }
}

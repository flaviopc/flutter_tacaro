import 'package:flutter/material.dart';
import 'package:ta_caro/shared/models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("E aí, ${user.name}"),
      ),
    );
  }
}

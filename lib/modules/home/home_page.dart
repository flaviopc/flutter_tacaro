import 'package:flutter/material.dart';
import 'package:ta_caro/shared/models/user_model.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/bottom_navigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  // final UserModel user;
  const HomePage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: Stack(
        children: [
          Positioned(
            bottom: 10,
            right: 20,
            left: 20,
            child: AppBottomNavigator(
              currentIndex: currentIndex,
              onChanged: changeIndex,
            ),
          )
        ],
      ),
    );
  }
}

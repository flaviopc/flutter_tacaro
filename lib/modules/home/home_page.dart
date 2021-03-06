import 'package:flutter/material.dart';
import 'package:ta_caro/modules/bottom_sheet/bottom_sheet.dart';
import 'package:ta_caro/shared/models/user_model.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/bottom_navigator/app_bottom_navigator.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  final List<Widget> pages;
  const HomePage({
    Key? key,
    required this.user,
    required this.pages,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  late final List<Widget> pages = widget.pages;
  void changeIndex(int index) async {
    print("entrou home");
    if (index == 3) {
      await showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          context: context,
          builder: (context) => AppBottomSheet());
    } else {
      currentIndex = index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            List.from(pages)[currentIndex],
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
      ),
    );
  }
}

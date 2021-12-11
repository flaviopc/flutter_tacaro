import 'package:flutter/material.dart';
import 'package:ta_caro/shared/models/user_model.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/bottom_navigator/app_bottom_navigator.dart';
import 'package:ta_caro/shared/widgets/cards/card_chart/card_chart.dart';
import 'package:ta_caro/shared/widgets/cards/card_product/card_product.dart';
import 'package:ta_caro/shared/widgets/list_tile/app_list_tile.dart';

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SafeArea(
              top: true,
              bottom: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardChart(
                            value: 432.90,
                            percent: 0.8,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text("Preço dos produtos").label,
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 126,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 2,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CardProduct(
                          like: index % 2 == 0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text("Últimas compras").label,
                          SizedBox(
                            height: 10,
                          ),
                          AppListTile(),
                          AppListTile(),
                          AppListTile(),
                          SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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

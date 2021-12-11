import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/cards/card_chart/card_chart.dart';
import 'package:ta_caro/shared/widgets/cards/card_product/card_product.dart';
import 'package:ta_caro/shared/widgets/list_tile/app_list_tile.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ta_caro/modules/feed/feed_controller.dart';
import 'package:ta_caro/modules/feed/repositories/feed_repository_impl.dart';
import 'package:ta_caro/shared/models/order_model.dart';
import 'package:ta_caro/shared/services/app_database.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';
import 'package:ta_caro/shared/widgets/cards/card_chart/card_chart.dart';
import 'package:ta_caro/shared/widgets/cards/card_product/card_product.dart';
import 'package:ta_caro/shared/widgets/list_tile/app_list_tile.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late final FeedController controller;
  @override
  void initState() {
    controller = FeedController(
        repository: FeedRepositoryImpl(database: AppDatabase.instance));
    controller.getData();
    print("entrou feed");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: AnimatedBuilder(
          animation: controller,
          builder: (_, __) => controller.appState.when(
            success: (value) {
              final orders = value as List<OrderModel>;
              final products = controller.products;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardChart(
                          value: controller.total,
                          percent: controller.calcChart(products),
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
                      itemCount: products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => CardProduct(
                        product: products[index],
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
                        for (var item in orders) AppListTile(order: item),
                        SizedBox(
                          height: 80,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            orElse: () => Container(),
          ),
        ),
      ),
    );
  }
}

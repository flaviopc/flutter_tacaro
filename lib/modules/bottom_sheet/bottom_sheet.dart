import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:ta_caro/modules/bottom_sheet/bottom_sheet_controller.dart';
import 'package:ta_caro/modules/bottom_sheet/repositories/order_repository_impl.dart';
import 'package:ta_caro/shared/services/supabase_database.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class AppBottomSheet extends StatefulWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  late final BottomSheetController controller;

  @override
  void initState() {
    controller = BottomSheetController(
        repository: OrderRepositoryImpl(database: SupabaseDatabase()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              InputText(
                label: "Produto",
                hint: "Digite um nome",
                onChanged: (value) => controller.onChange(name: value),
                validator: (value) =>
                    value.isNotEmpty ? null : "informe o nome do produto",
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                label: "Preço",
                hint: "Digite o valor",
                onChanged: (value) => controller.onChange(price: value),
                validator: (value) =>
                    value.isNotEmpty ? null : "informe o valor do produto",
                inputFormatters: [MoneyInputFormatter(leadingSymbol: "R\$")],
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 8,
              ),
              InputText(
                  label: "Data da compra",
                  hint: "Digite dd/mm/aaaa",
                  onChanged: (value) => controller.onChange(date: value),
                  keyboardType: TextInputType.datetime,
                  validator: (value) =>
                      value.isNotEmpty ? null : "informe a data",
                  inputFormatters: [
                    MaskedInputFormatter(
                      '00/00/0000',
                    )
                  ]),
              SizedBox(
                height: 20,
              ),
              Button(
                  label: "Adicionar",
                  onTap: () {
                    controller.create();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

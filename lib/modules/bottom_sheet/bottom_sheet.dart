import 'package:flutter/material.dart';
import 'package:ta_caro/shared/widgets/button/button.dart';
import 'package:ta_caro/shared/widgets/input_text/input_text.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            InputText(label: "Produto", hint: "Digite um nome"),
            SizedBox(
              height: 8,
            ),
            InputText(label: "Preço", hint: "Digite o valor"),
            SizedBox(
              height: 8,
            ),
            InputText(label: "Data da compra", hint: "Digite dd/mm/aaaa"),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Button(label: "Adicionar", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

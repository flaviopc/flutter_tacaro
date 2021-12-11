import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30,
            child: Text("12/11"),
          ),
          title: Text("Produt"),
          subtitle: Text("preço"),
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text("Editar")),
              PopupMenuItem(child: Text("Excluir")),
            ],
          ),
        ),
      ),
    );
  }
}

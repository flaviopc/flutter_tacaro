import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.colors.background,
            radius: 30,
            child: Text(
              "12/11",
              style: AppTheme.textStyles.label,
            ),
          ),
          title: Text(
            "Produt",
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "preço",
            style: AppTheme.textStyles.subtitleListTile,
          ),
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

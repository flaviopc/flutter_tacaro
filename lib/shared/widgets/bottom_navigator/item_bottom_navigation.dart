import 'package:flutter/material.dart';
import 'package:ta_caro/shared/themes/app_theme.dart';

class ItemBottomNavigator extends StatelessWidget {
  final Function() onTap;
  final bool enabled;
  final IconData icon;
  const ItemBottomNavigator({
    Key? key,
    required this.onTap,
    required this.enabled,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        child: Icon(icon,
            color: enabled
                ? AppTheme.colors.textEnabled
                : AppTheme.colors.iconInactive),
        decoration: BoxDecoration(
          color: enabled ? AppTheme.colors.primary : AppTheme.colors.background,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

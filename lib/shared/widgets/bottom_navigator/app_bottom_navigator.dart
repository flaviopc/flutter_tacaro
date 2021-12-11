import 'package:flutter/material.dart';

import 'package:ta_caro/shared/themes/app_theme.dart';

import 'item_bottom_navigation.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChanged;
  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: AppTheme.colors.textEnabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemBottomNavigator(
              icon: Icons.home,
              onTap: () => onChanged(0),
              enabled: currentIndex == 0),
          ItemBottomNavigator(
              icon: Icons.add_box,
              onTap: () => onChanged(3),
              enabled: currentIndex == 3),
          ItemBottomNavigator(
              icon: Icons.settings,
              onTap: () => onChanged(1),
              enabled: currentIndex == 1),
        ],
      ),
    );
  }
}

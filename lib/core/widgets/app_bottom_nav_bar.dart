import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../theme/app_colors.dart';

class BottomNavItemData {
  const BottomNavItemData({required this.iconPath, required this.label});

  final String iconPath;
  final String label;
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavItemData> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(top: 12.sp(context), bottom: 4.sp(context)),
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(child: _buildItem(context, i)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final bool selected = index == currentIndex;
    final Color color = selected
        ? AppColors.textPrimary
        : AppColors.textTertiary;
    final item = items[index];

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset( item.iconPath, color: color),
          6.sp(context).verticalSpace,
          Text(
            item.label,
            style: TextStyle(
              fontSize: 10.sp(context),
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

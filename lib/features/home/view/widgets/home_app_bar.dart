import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.weekLabel, this.onWeekTap});

  final String weekLabel;
  final VoidCallback? onWeekTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.sp(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/icons/notification_icon.png',
              color: AppColors.textPrimary,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onWeekTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/circle_moon.png',
                  color: AppColors.textPrimary,
                
                ),
                8.sp(context).horizontalSpace,
                Text(
                  weekLabel,
                  style: TextStyle(
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                4.sp(context).horizontalSpace,
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.textPrimary,
                  size: 20.sp(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

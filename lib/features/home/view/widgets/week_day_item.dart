import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/week_day.dart';

class WeekDayItem extends StatelessWidget {
  const WeekDayItem({
    super.key,
    required this.day,
    required this.selected,
    required this.onTap,
  });

  final WeekDay day;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final double circleSize = 40.sp(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            day.label,
            style: TextStyle(
              fontSize: 11.sp(context),
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          12.sp(context).verticalSpace,
          Container(
            width: circleSize,
            height: circleSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant,
              shape: BoxShape.circle,
              border: selected
                  ? Border.all(color: AppColors.greenRing, width: 2)
                  : null,
            ),
            child: Text(
              '${day.dayNumber}',
              style: TextStyle(
                fontSize: 14.sp(context),
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          8.sp(context).verticalSpace,
          Container(
            width: 6.sp(context),
            height: 6.sp(context),
            decoration: BoxDecoration(
              color: selected ? AppColors.green : Colors.transparent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

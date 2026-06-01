import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import 'calorie_progress_bar.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({
    super.key,
    required this.calories,
    required this.remaining,
    required this.max,
  });

  final int calories;
  final int remaining;
  final int max;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(18.sp(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$calories',
                  style: TextStyle(
                    fontSize: 38.sp(context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
                4.sp(context).horizontalSpace,
                Padding(
                  padding: EdgeInsets.only(bottom: 4.sp(context)),
                  child: Text(
                    'Calories',
                    style: TextStyle(
                      fontSize: 14.sp(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          6.sp(context).verticalSpace,
          Text(
            '$remaining Remaining',
            style: TextStyle(
              fontSize: 12.sp(context),
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          24.sp(context).verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontSize: 11.sp(context),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '$max',
                style: TextStyle(
                  fontSize: 11.sp(context),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          10.sp(context).verticalSpace,
          CalorieProgressBar(progress: calories / max),
        ],
      ),
    );
  }
}

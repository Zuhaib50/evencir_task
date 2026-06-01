import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/week_section.dart';

class WeekSectionHeader extends StatelessWidget {
  const WeekSectionHeader({
    super.key,
    required this.section,
    required this.horizontalPadding,
  });

  final WeekSection section;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.planSectionHeader,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 16.sp(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              fontSize: 20.sp(context),
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          6.sp(context).verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  section.dateRange,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp(context),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              12.sp(context).horizontalSpace,
              Text(
                section.total,
                style: TextStyle(
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

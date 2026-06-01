import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class MoodHeader extends StatelessWidget {
  const MoodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mood',
          style: TextStyle(
            fontSize: 28.sp(context),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        20.sp(context).verticalSpace,
        Text(
          'Start your day',
          style: TextStyle(
            fontSize: 13.sp(context),
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondary,
          ),
        ),
        8.sp(context).verticalSpace,
        Text(
          'How are you feeling at the Moment?',
          style: TextStyle(
            fontSize: 22.sp(context),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

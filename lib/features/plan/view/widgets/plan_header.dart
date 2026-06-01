import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class PlanHeader extends StatelessWidget {
  const PlanHeader({super.key, required this.horizontalPadding, this.onSave});

  final double horizontalPadding;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              'Training Calendar',
              style: TextStyle(
                fontSize: 22.sp(context),
                fontWeight: FontWeight.normal,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          12.sp(context).horizontalSpace,
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onSave,
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 18.sp(context),
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

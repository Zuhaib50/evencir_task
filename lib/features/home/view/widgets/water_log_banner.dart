import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class WaterLogBanner extends StatelessWidget {
  const WaterLogBanner({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.waterBanner,
      padding: EdgeInsets.symmetric(vertical: 16.sp(context)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.sp(context),
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

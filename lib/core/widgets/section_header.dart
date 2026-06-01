import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import '../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.color = AppColors.textPrimary,
  });

  final String title;
  final Widget? trailing;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize.sp(context),
            fontWeight: fontWeight,
            color: color,
            height: 1.1,
          ),
        ),
        ?trailing,
      ],
    );
  }
}

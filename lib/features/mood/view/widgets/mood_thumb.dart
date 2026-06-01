import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class MoodThumb extends StatelessWidget {
  const MoodThumb({super.key, required this.diameter});

  final double diameter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.thumb, AppColors.thumb],
          stops: [0.55, 1.0],
        ),
      ),
    );
  }
}

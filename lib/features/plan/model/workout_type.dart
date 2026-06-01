import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

enum WorkoutType {
  arms(
    label: 'Arms Workout',
    icon: Icons.fitness_center,
    textColor: AppColors.armsTagText,
    backgroundColor: AppColors.armsTagBg,
  ),
  legs(
    label: 'Leg Workout',
    icon: Icons.directions_run,
    textColor: AppColors.legsTagText,
    backgroundColor: AppColors.legsTagBg,
  );

  const WorkoutType({
    required this.label,
    required this.icon,
    required this.textColor,
    required this.backgroundColor,
  });

  final String label;
  final IconData icon;
  final Color textColor;
  final Color backgroundColor;
}

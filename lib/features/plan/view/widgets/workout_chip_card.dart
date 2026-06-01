import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/workout_plan.dart';
import 'workout_tag.dart';

class WorkoutChipCard extends StatelessWidget {
  const WorkoutChipCard({super.key, required this.workout});

  final WorkoutPlan workout;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.planCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4.sp(context), color: AppColors.cardAccent),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.sp(context),
                  vertical: 12.sp(context),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.drag_indicator,
                      size: 20.sp(context),
                      color: AppColors.dragHandle,
                    ),
                    8.sp(context).horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          WorkoutTag(type: workout.type),
                          8.sp(context).verticalSpace,
                          Text(
                            workout.title,
                            style: TextStyle(
                              fontSize: 16.sp(context),
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.sp(context).horizontalSpace,
                    Text(
                      workout.duration,
                      style: TextStyle(
                        fontSize: 14.sp(context),
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

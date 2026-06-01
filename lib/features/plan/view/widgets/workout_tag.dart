import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../model/workout_type.dart';

class WorkoutTag extends StatelessWidget {
  const WorkoutTag({super.key, required this.type});

  final WorkoutType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.sp(context),
        vertical: 4.sp(context),
      ),
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(type.icon, size: 14.sp(context), color: type.textColor),
          5.sp(context).horizontalSpace,
          Flexible(
            child: Text(
              type.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11.sp(context),
                fontWeight: FontWeight.w600,
                color: type.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

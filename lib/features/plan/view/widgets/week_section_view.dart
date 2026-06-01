import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/plan_drag_data.dart';
import '../../model/week_section.dart';
import 'day_row.dart';
import 'week_section_header.dart';

class WeekSectionView extends StatelessWidget {
  const WeekSectionView({
    super.key,
    required this.section,
    required this.weekIndex,
    required this.horizontalPadding,
    required this.topLineColor,
    required this.onDropOnDay,
  });

  final WeekSection section;
  final int weekIndex;
  final double horizontalPadding;
  final Color topLineColor;

  final void Function(PlanDragData from, int toDay) onDropOnDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(height: 2.sp(context), color: topLineColor),
        WeekSectionHeader(
          section: section,
          horizontalPadding: horizontalPadding,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              for (var i = 0; i < section.days.length; i++) ...[
                DayRow(
                  day: section.days[i],
                  weekIndex: weekIndex,
                  dayIndex: i,
                  onDrop: (from) => onDropOnDay(from, i),
                ),
                if (i != section.days.length - 1)
                  Divider(height: 1, thickness: 1, color: AppColors.border),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

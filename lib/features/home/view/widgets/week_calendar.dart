import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/week_day.dart';
import 'week_day_item.dart';

class WeekCalendar extends StatelessWidget {
  const WeekCalendar({
    super.key,
    required this.week,
    required this.selectedIndex,
    required this.onSelectDate,
  });

  final List<WeekDay> week;
  final int selectedIndex;
  final ValueChanged<DateTime> onSelectDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 0; i < week.length; i++)
              WeekDayItem(
                day: week[i],
                selected: i == selectedIndex,
                onTap: () => onSelectDate(week[i].date),
              ),
          ],
        ),
        12.sp(context).verticalSpace,
        Container(
          width: 36.sp(context),
          height: 4.sp(context),
          decoration: BoxDecoration(
            color: AppColors.trackInactive,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../extensions/num_extensions.dart';
import '../theme/app_colors.dart';

class AppCalendarSheet extends StatefulWidget {
  const AppCalendarSheet({super.key, required this.initialDate});

  final DateTime initialDate;

  static Future<DateTime?> show(
    BuildContext context, {
    required DateTime initialDate,
  }) {
    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => AppCalendarSheet(initialDate: initialDate),
    );
  }

  @override
  State<AppCalendarSheet> createState() => _AppCalendarSheetState();
}

class _AppCalendarSheetState extends State<AppCalendarSheet> {
  late DateTime _focusedDay = widget.initialDate;

  @override
  Widget build(BuildContext context) {
    final TextStyle dayStyle = TextStyle(
      fontSize: 14.sp(context),
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    );

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.sp(context))),
      ),
      padding: EdgeInsets.fromLTRB(
        12.sp(context),
        12.sp(context),
        12.sp(context),
        24.sp(context),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56.sp(context),
              height: 5.sp(context),
              decoration: BoxDecoration(
                color: AppColors.textSecondary,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            16.sp(context).verticalSpace,
            TableCalendar(
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              focusedDay: _focusedDay,
              currentDay: widget.initialDate,
              startingDayOfWeek: StartingDayOfWeek.monday,
              rowHeight: 54.sp(context),
              daysOfWeekHeight: 40.sp(context),
              availableGestures: AvailableGestures.horizontalSwipe,
              selectedDayPredicate: (day) => isSameDay(day, widget.initialDate),
              onDaySelected: (selectedDay, _) =>
                  Navigator.of(context).pop(selectedDay),
              onPageChanged: (focusedDay) =>
                  setState(() => _focusedDay = focusedDay),
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                outsideDaysVisible: false,
                defaultTextStyle: dayStyle,
                weekendTextStyle: dayStyle,
                selectedTextStyle: dayStyle,
                selectedDecoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.fromBorderSide(
                    BorderSide(color: AppColors.greenRing, width: 2),
                  ),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                headerPadding: EdgeInsets.symmetric(vertical: 8.sp(context)),
                titleTextStyle: TextStyle(
                  fontSize: 16.sp(context),
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMM(locale).format(date),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: AppColors.textPrimary,
                  size: 26.sp(context),
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: AppColors.textPrimary,
                  size: 26.sp(context),
                ),
              ),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) => Center(
                  child: Text(
                    DateFormat.E().format(day).toUpperCase(),
                    style: TextStyle(
                      fontSize: 11.sp(context),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../model/day_plan.dart';
import '../../model/plan_drag_data.dart';
import 'workout_chip_card.dart';

class DayRow extends StatelessWidget {
  const DayRow({
    super.key,
    required this.day,
    required this.weekIndex,
    required this.dayIndex,
    required this.onDrop,
  });

  final DayPlan day;
  final int weekIndex;
  final int dayIndex;
  final ValueChanged<PlanDragData> onDrop;

  @override
  Widget build(BuildContext context) {
    final bool active = day.workout != null;
    final Color tone = active ? AppColors.textPrimary : AppColors.textSecondary;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.sp(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 46.sp(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  day.weekday,
                  style: TextStyle(
                    fontSize: 13.sp(context),
                    fontWeight: FontWeight.w600,
                    color: tone,
                  ),
                ),
                2.sp(context).verticalSpace,
                Text(
                  '${day.dayNumber}',
                  style: TextStyle(
                    fontSize: 24.sp(context),
                    fontWeight: FontWeight.w700,
                    color: tone,
                  ),
                ),
              ],
            ),
          ),
          2.sp(context).horizontalSpace,
          Expanded(child: _dropSlot(_slotChild(context))),
        ],
      ),
    );
  }

  Widget? _slotChild(BuildContext context) {
    final workout = day.workout;
    if (workout == null) return null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final card = WorkoutChipCard(workout: workout);
        return Draggable<PlanDragData>(
          data: PlanDragData(
            workout: workout,
            weekIndex: weekIndex,
            dayIndex: dayIndex,
          ),
          feedback: Material(
            color: Colors.transparent,
            child: SizedBox(width: constraints.maxWidth, child: card),
          ),
          childWhenDragging: Opacity(opacity: 0.25, child: card),
          child: card,
        );
      },
    );
  }

  Widget _dropSlotBuilder(BuildContext context, bool hovering, Widget? child) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      constraints: BoxConstraints(minHeight: 56.sp(context)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hovering ? AppColors.planLineTeal : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: child ?? const SizedBox(width: double.infinity),
    );
  }

  Widget _dropSlot(Widget? child) {
    return DragTarget<PlanDragData>(
      onWillAcceptWithDetails: (_) => true,
      onAcceptWithDetails: (details) => onDrop(details.data),
      builder: (context, candidate, rejected) =>
          _dropSlotBuilder(context, candidate.isNotEmpty, child),
    );
  }
}

import 'workout_plan.dart';

class PlanDragData {
  const PlanDragData({
    required this.workout,
    required this.weekIndex,
    required this.dayIndex,
  });

  final WorkoutPlan workout;
  final int weekIndex;
  final int dayIndex;
}

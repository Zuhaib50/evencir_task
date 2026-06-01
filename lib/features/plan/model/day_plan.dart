import 'package:equatable/equatable.dart';

import 'workout_plan.dart';

class DayPlan extends Equatable {
  const DayPlan({
    required this.weekday,
    required this.dayNumber,
    this.workout,
  });

  final String weekday;
  final int dayNumber;
  final WorkoutPlan? workout;

  DayPlan copyWith({Object? workout = _sentinel}) {
    return DayPlan(
      weekday: weekday,
      dayNumber: dayNumber,
      workout: workout == _sentinel ? this.workout : workout as WorkoutPlan?,
    );
  }

  static const Object _sentinel = Object();

  @override
  List<Object?> get props => [weekday, dayNumber, workout];
}

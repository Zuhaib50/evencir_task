import 'package:equatable/equatable.dart';

import '../model/day_plan.dart';
import '../model/week_section.dart';
import '../model/workout_plan.dart';
import '../model/workout_type.dart';

class PlanState extends Equatable {
  const PlanState({required this.weeks});

  final List<WeekSection> weeks;

  factory PlanState.initial() {
    return const PlanState(
      weeks: [
        WeekSection(
          title: 'Week 2/8',
          dateRange: 'December 8-14',
          total: 'Total: 60min',
          days: [
            DayPlan(
              weekday: 'Mon',
              dayNumber: 8,
              workout: WorkoutPlan(
                id: 'w1',
                type: WorkoutType.arms,
                title: 'Arm Blaster',
                duration: '25m - 30m',
              ),
            ),
            DayPlan(weekday: 'Tue', dayNumber: 9),
            DayPlan(weekday: 'Wed', dayNumber: 10),
            DayPlan(
              weekday: 'Thu',
              dayNumber: 11,
              workout: WorkoutPlan(
                id: 'w2',
                type: WorkoutType.legs,
                title: 'Leg Day Blitz',
                duration: '25m - 30m',
              ),
            ),
            DayPlan(weekday: 'Fri', dayNumber: 12),
            DayPlan(weekday: 'Sat', dayNumber: 13),
            DayPlan(weekday: 'Sun', dayNumber: 14),
          ],
        ),
        WeekSection(
          title: 'Week 3/8',
          dateRange: 'December 15-21',
          total: 'Total: 60min',
          days: [
            DayPlan(weekday: 'Mon', dayNumber: 15),
            DayPlan(
              weekday: 'Tue',
              dayNumber: 16,
              workout: WorkoutPlan(
                id: 'w3',
                type: WorkoutType.arms,
                title: 'Push Day',
                duration: '20m - 25m',
              ),
            ),
            DayPlan(weekday: 'Wed', dayNumber: 17),
            DayPlan(weekday: 'Thu', dayNumber: 18),
            DayPlan(
              weekday: 'Fri',
              dayNumber: 19,
              workout: WorkoutPlan(
                id: 'w4',
                type: WorkoutType.legs,
                title: 'Lower Body',
                duration: '30m - 35m',
              ),
            ),
            DayPlan(weekday: 'Sat', dayNumber: 20),
            DayPlan(weekday: 'Sun', dayNumber: 21),
          ],
        ),
      ],
    );
  }

  PlanState copyWith({List<WeekSection>? weeks}) {
    return PlanState(weeks: weeks ?? this.weeks);
  }

  @override
  List<Object?> get props => [weeks];
}

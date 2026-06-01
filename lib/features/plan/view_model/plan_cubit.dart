import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/day_plan.dart';
import 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanState.initial());

  void moveWorkout({
    required int fromWeek,
    required int fromDay,
    required int toWeek,
    required int toDay,
  }) {
    if (fromWeek == toWeek && fromDay == toDay) return;

    final weeks = state.weeks
        .map((w) => w.copyWith(days: List<DayPlan>.of(w.days)))
        .toList();

    final source = weeks[fromWeek].days[fromDay];
    final target = weeks[toWeek].days[toDay];

    weeks[toWeek].days[toDay] = target.copyWith(workout: source.workout);
    weeks[fromWeek].days[fromDay] = source.copyWith(workout: target.workout);

    emit(state.copyWith(weeks: weeks));
  }
}

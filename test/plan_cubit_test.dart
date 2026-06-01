import 'package:flutter_test/flutter_test.dart';

import 'package:evencir_task/features/plan/view_model/plan_cubit.dart';

void main() {
  group('PlanCubit.moveWorkout', () {
    test('moves a workout onto an empty day', () {
      final cubit = PlanCubit();

      cubit.moveWorkout(fromWeek: 0, fromDay: 0, toWeek: 0, toDay: 1);

      expect(cubit.state.weeks[0].days[0].workout, isNull);
      expect(cubit.state.weeks[0].days[1].workout?.title, 'Arm Blaster');
    });

    test('swaps when the target day already has a workout', () {
      final cubit = PlanCubit();

      cubit.moveWorkout(fromWeek: 0, fromDay: 0, toWeek: 0, toDay: 3);

      expect(cubit.state.weeks[0].days[0].workout?.title, 'Leg Day Blitz');
      expect(cubit.state.weeks[0].days[3].workout?.title, 'Arm Blaster');
    });

    test('moves a workout across weeks', () {
      final cubit = PlanCubit();

      cubit.moveWorkout(fromWeek: 0, fromDay: 0, toWeek: 1, toDay: 0);

      expect(cubit.state.weeks[0].days[0].workout, isNull);
      expect(cubit.state.weeks[1].days[0].workout?.title, 'Arm Blaster');
    });

    test('is a no-op when source and target are the same', () {
      final cubit = PlanCubit();

      cubit.moveWorkout(fromWeek: 0, fromDay: 0, toWeek: 0, toDay: 0);

      expect(cubit.state.weeks[0].days[0].workout?.title, 'Arm Blaster');
    });
  });
}

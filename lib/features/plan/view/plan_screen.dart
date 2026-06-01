import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../view_model/plan_cubit.dart';
import '../view_model/plan_state.dart';
import 'widgets/plan_header.dart';
import 'widgets/week_section_view.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlanCubit(),
      child: const _PlanView(),
    );
  }
}

class _PlanView extends StatelessWidget {
  const _PlanView();

  @override
  Widget build(BuildContext context) {
    final double hPad = Responsive(context).horizontalPadding;
    final cubit = context.read<PlanCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            16.sp(context).verticalSpace,
            PlanHeader(
              horizontalPadding: hPad,
              onSave: () {},
            ),
            16.sp(context).verticalSpace,
            Expanded(
              child: BlocBuilder<PlanCubit, PlanState>(
                builder: (context, state) {
                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: 24.sp(context)),
                    itemCount: state.weeks.length,
                    itemBuilder: (context, weekIndex) {
                      return WeekSectionView(
                        section: state.weeks[weekIndex],
                        weekIndex: weekIndex,
                        horizontalPadding: hPad,
                        topLineColor: weekIndex == 0
                            ? AppColors.planLineBlue
                            : AppColors.planLineTeal,
                        onDropOnDay: (from, toDay) => cubit.moveWorkout(
                          fromWeek: from.weekIndex,
                          fromDay: from.dayIndex,
                          toWeek: weekIndex,
                          toDay: toDay,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

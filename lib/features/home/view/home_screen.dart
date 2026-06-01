import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/num_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/app_calendar_sheet.dart';
import '../../../core/widgets/section_header.dart';
import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/insights_section.dart';
import 'widgets/week_calendar.dart';
import 'widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  Future<void> _openCalendar(
    BuildContext context,
    HomeCubit cubit,
    HomeState state,
  ) async {
    final picked = await AppCalendarSheet.show(
      context,
      initialDate: state.selectedDate,
    );
    if (picked != null) cubit.selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    final double hPad = responsive.horizontalPadding;
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                hPad,
                12.sp(context),
                hPad,
                24.sp(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(
                    weekLabel: state.weekLabel,
                    onWeekTap: () => _openCalendar(context, cubit, state),
                  ),
                  22.sp(context).verticalSpace,
                  Text(
                    'Today, ${DateFormat('dd MMM yyyy').format(state.selectedDate)}',
                    style: TextStyle(
                      fontSize: 16.sp(context),
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  18.sp(context).verticalSpace,
                  WeekCalendar(
                    week: state.week,
                    selectedIndex: state.selectedDayIndex,
                    onSelectDate: cubit.selectDate,
                  ),
                  26.sp(context).verticalSpace,
                  SectionHeader(
                    title: 'Workouts',
                    trailing: _Weather(temperature: '9°', isDay: state.isDay),
                  ),
                  16.sp(context).verticalSpace,
                  const WorkoutCard(
                    subtitle: 'December 22 - 25m - 30m',
                    title: 'Upper Body',
                  ),
                  30.sp(context).verticalSpace,
                  const SectionHeader(title: 'My Insights'),
                  16.sp(context).verticalSpace,
                  const InsightsSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Weather extends StatelessWidget {
  const _Weather({required this.temperature, required this.isDay});

  final String temperature;
  final bool isDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isDay ? Icons.wb_sunny : Icons.nightlight_round,
          color: AppColors.textPrimary,
          size: 22.sp(context),
        ),
        8.sp(context).horizontalSpace,
        Text(
          temperature,
          style: TextStyle(
            fontSize: 20.sp(context),
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/num_extensions.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive.dart';
import '../../../core/widgets/primary_button.dart';
import '../view_model/mood_cubit.dart';
import '../view_model/mood_state.dart';
import 'widgets/mood_header.dart';
import 'widgets/mood_wheel.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => MoodCubit(), child: const _MoodView());
  }
}

class _MoodView extends StatelessWidget {
  const _MoodView();

  @override
  Widget build(BuildContext context) {
    final double hPad = Responsive(context).horizontalPadding;
    final cubit = context.read<MoodCubit>();
    final double wheelDiameter = context.screenWidth * 0.62;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1.1),
            radius: 1.1,
            colors: [AppColors.moodGlow, AppColors.background],
            stops: [0.0, 0.55],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                12.sp(context).verticalSpace,
                const MoodHeader(),
                Expanded(
                  child: BlocBuilder<MoodCubit, MoodState>(
                    builder: (context, state) {
                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MoodWheel(
                              diameter: wheelDiameter,
                              angle: state.angle,
                              mood: state.mood,
                              onAngleChanged: cubit.updateAngle,
                            ),
                            40.sp(context).verticalSpace,
                            Text(
                              state.mood.label,
                              style: TextStyle(
                                fontSize: 28.sp(context),
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: () {
                    
                  },
                ),
                24.sp(context).verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

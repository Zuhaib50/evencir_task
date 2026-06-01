import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';

class HydrationScale extends StatelessWidget {
  const HydrationScale({super.key, required this.reading});

  final String reading;

  @override
  Widget build(BuildContext context) {
    final double lineLeft = 44.sp(context);
    final double pillOffset = 7.sp(context);

    return SizedBox(
      height: 120.sp(context),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double h = constraints.maxHeight;
          final double topY = 6.sp(context);
          final double bottomY = h - 14.sp(context);

          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: lineLeft,
                top: topY,
                height: bottomY - topY,
                child: _dashedLine(context),
              ),
              Positioned(left: 0, top: 0, child: _label(context, '2 L')),
              Positioned(
                left: 0,
                top: bottomY - 7.sp(context),
                child: _label(context, '0 L'),
              ),
              _pill(context, left: lineLeft - pillOffset, top: topY),
              _pill(context, left: lineLeft - pillOffset, top: h * 0.46),
              _pill(
                context,
                left: lineLeft - pillOffset,
                top: bottomY - 2.5.sp(context),
              ),
              Positioned(
                left: lineLeft + 12.sp(context),
                right: 42.sp(context),
                top: bottomY,
                child: Container(height: 1.5.sp(context), color: AppColors.trackInactive),
              ),
              Positioned(
                right: 0,
                top: bottomY - 11.sp(context),
                child: Text(
                  reading,
                  style: TextStyle(
                    fontSize: 18.sp(context),
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _label(BuildContext context, String text) => Text(
        text,
        style: TextStyle(
          fontSize: 10.sp(context),
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      );

  Widget _dashedLine(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          9,
          (_) => Container(
            width: 1.5.sp(context),
            height: 5.sp(context),
            color: AppColors.blue,
          ),
        ),
      );

  Widget _pill(BuildContext context, {required double left, required double top}) =>
      Positioned(
        left: left,
        top: top,
        child: Container(
          width: 15.sp(context),
          height: 5.sp(context),
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      );
}

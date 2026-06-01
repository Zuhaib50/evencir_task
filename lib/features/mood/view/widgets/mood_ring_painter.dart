import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class MoodRingPainter extends CustomPainter {
  const MoodRingPainter({required this.strokeWidth, this.tickCount = 16});

  final double strokeWidth;
  final int tickCount;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide - strokeWidth) / 2;

    const sweep = SweepGradient(
      colors: [
        AppColors.moodYellow,
        AppColors.moodTeal,
        AppColors.moodGreen,
        AppColors.moodPurple,
        AppColors.moodPurple,
        AppColors.moodPink,
        AppColors.moodRed,
        AppColors.moodOrange,
        AppColors.moodYellow,
      ],
      stops: [0.0, 0.12, 0.30, 0.44, 0.56, 0.70, 0.82, 0.92, 1.0],
      transform: GradientRotation(-math.pi / 2),
    );

    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = sweep.createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

    canvas.drawCircle(center, radius, ringPaint);

    final tickPaint = Paint()
      ..color = AppColors.ringTick
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final inner = radius - strokeWidth / 2 + 1.5;
    final outer = radius + strokeWidth / 2 - 1.5;
    for (var i = 0; i < tickCount; i++) {
      final theta = (i / tickCount) * 2 * math.pi - math.pi / 2;
      final dir = Offset(math.cos(theta), math.sin(theta));
      canvas.drawLine(center + dir * inner, center + dir * outer, tickPaint);
    }
  }

  @override
  bool shouldRepaint(MoodRingPainter oldDelegate) =>
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.tickCount != tickCount;
}

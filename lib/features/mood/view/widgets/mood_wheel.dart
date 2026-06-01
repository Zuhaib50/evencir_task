import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../model/mood.dart';
import 'mood_face.dart';
import 'mood_ring_painter.dart';
import 'mood_thumb.dart';

class MoodWheel extends StatelessWidget {
  const MoodWheel({
    super.key,
    required this.diameter,
    required this.angle,
    required this.mood,
    required this.onAngleChanged,
  });

  final double diameter;
  final double angle;
  final Mood mood;
  final ValueChanged<double> onAngleChanged;

  @override
  Widget build(BuildContext context) {
    final double strokeWidth = diameter * 0.085;
    final double ringRadius = diameter / 2 - strokeWidth / 2;
    final double thumbDiameter = strokeWidth * 1.9;
    final double faceSize = diameter * 0.43;

    final double boxSize = diameter + thumbDiameter;
    final center = Offset(boxSize / 2, boxSize / 2);
    final thumbCenter =
        center + Offset(math.sin(angle), -math.cos(angle)) * ringRadius;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: (d) => _report(d.localPosition, center),
      onPanUpdate: (d) => _report(d.localPosition, center),
      child: SizedBox(
        width: boxSize,
        height: boxSize,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size.square(diameter),
              painter: MoodRingPainter(strokeWidth: strokeWidth),
            ),
            MoodFaceView(mood: mood, size: faceSize),
            Positioned(
              left: thumbCenter.dx - thumbDiameter / 2,
              top: thumbCenter.dy - thumbDiameter / 2,
              child: MoodThumb(diameter: thumbDiameter),
            ),
          ],
        ),
      ),
    );
  }

  void _report(Offset position, Offset center) {
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    var theta = math.atan2(dx, -dy);
    if (theta < 0) theta += 2 * math.pi;
    onAngleChanged(theta);
  }
}

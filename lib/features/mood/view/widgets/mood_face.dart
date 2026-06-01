import 'package:flutter/material.dart';

import '../../model/mood.dart';

class MoodFaceView extends StatelessWidget {
  const MoodFaceView({super.key, required this.mood, required this.size});

  final Mood mood;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      mood.asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}

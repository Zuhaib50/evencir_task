import 'package:equatable/equatable.dart';

import '../model/mood.dart';

class MoodState extends Equatable {
  const MoodState({required this.angle});

  final double angle;

  factory MoodState.initial() => MoodState(angle: Mood.all.first.anchorAngle);

  Mood get mood => Mood.nearest(angle);

  MoodState copyWith({double? angle}) => MoodState(angle: angle ?? this.angle);

  @override
  List<Object?> get props => [angle];
}

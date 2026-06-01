import 'package:equatable/equatable.dart';

import 'workout_type.dart';

class WorkoutPlan extends Equatable {
  const WorkoutPlan({
    required this.id,
    required this.type,
    required this.title,
    required this.duration,
  });

  final String id;
  final WorkoutType type;
  final String title;
  final String duration;

  @override
  List<Object?> get props => [id, type, title, duration];
}

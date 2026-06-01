import 'package:equatable/equatable.dart';

import 'day_plan.dart';

class WeekSection extends Equatable {
  const WeekSection({
    required this.title,
    required this.dateRange,
    required this.total,
    required this.days,
  });

  final String title;
  final String dateRange;
  final String total;
  final List<DayPlan> days;

  WeekSection copyWith({List<DayPlan>? days}) {
    return WeekSection(
      title: title,
      dateRange: dateRange,
      total: total,
      days: days ?? this.days,
    );
  }

  @override
  List<Object?> get props => [title, dateRange, total, days];
}

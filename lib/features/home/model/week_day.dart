import 'package:equatable/equatable.dart';

class WeekDay extends Equatable {
  const WeekDay({
    required this.label,
    required this.date,
  });

  final String label;
  final DateTime date;

  int get dayNumber => date.day;

  @override
  List<Object?> get props => [label, date];
}

import 'package:equatable/equatable.dart';

import '../model/week_day.dart';

class HomeState extends Equatable {
  const HomeState({required this.selectedDate, required this.isDay});

  final DateTime selectedDate;

  final bool isDay;

  factory HomeState.initial() {
    return HomeState(
      selectedDate: DateTime.now(),
      isDay: isDaytime(DateTime.now()),
    );
  }

  static bool isDaytime(DateTime time) => time.hour >= 6 && time.hour < 18;

  static const List<String> _labels = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];

  List<WeekDay> get week {
    final monday = selectedDate.subtract(
      Duration(days: selectedDate.weekday - 1),
    );
    return List.generate(7, (i) {
      final date = DateTime(monday.year, monday.month, monday.day + i);
      return WeekDay(label: _labels[i], date: date);
    });
  }

  int get selectedDayIndex => selectedDate.weekday - 1;

  String get weekLabel => 'Week $_weekOfMonth/$_totalWeeksInMonth';

  int get _monthStartOffset {
    final first = DateTime(selectedDate.year, selectedDate.month, 1);
    return first.weekday - 1;
  }

  int get _weekOfMonth =>
      ((_monthStartOffset + selectedDate.day - 1) ~/ 7) + 1;

  int get _totalWeeksInMonth {
    final daysInMonth =
        DateTime(selectedDate.year, selectedDate.month + 1, 0).day;
    return (_monthStartOffset + daysInMonth + 6) ~/ 7;
  }

  HomeState copyWith({DateTime? selectedDate, bool? isDay}) {
    return HomeState(
      selectedDate: selectedDate ?? this.selectedDate,
      isDay: isDay ?? this.isDay,
    );
  }

  @override
  List<Object?> get props => [selectedDate, isDay];
}

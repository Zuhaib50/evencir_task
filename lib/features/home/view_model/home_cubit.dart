import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial()) {
    _clock = Timer.periodic(const Duration(minutes: 1), (_) => _refreshDaytime());
  }

  Timer? _clock;

  void selectDate(DateTime date) =>
      emit(state.copyWith(selectedDate: DateTime(date.year, date.month, date.day)));

  void _refreshDaytime() {
    final isDay = HomeState.isDaytime(DateTime.now());
    if (isDay != state.isDay) emit(state.copyWith(isDay: isDay));
  }

  @override
  Future<void> close() {
    _clock?.cancel();
    return super.close();
  }
}

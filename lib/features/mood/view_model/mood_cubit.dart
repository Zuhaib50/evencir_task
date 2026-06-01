import 'package:flutter_bloc/flutter_bloc.dart';

import 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  MoodCubit() : super(MoodState.initial());

  void updateAngle(double angle) => emit(state.copyWith(angle: angle));
}

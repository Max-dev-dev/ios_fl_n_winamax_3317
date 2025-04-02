import 'package:flutter_bloc/flutter_bloc.dart';

class TimerModel {
  final String name;
  final Duration workDuration;
  final Duration restDuration;
  final int rounds;

  TimerModel({
    required this.name,
    required this.workDuration,
    required this.restDuration,
    required this.rounds,
  });
}

class TimerCubit extends Cubit<List<TimerModel>> {
  TimerCubit() : super([]);

  void addTimer(TimerModel timer) {
    emit([...state, timer]);
  }

  void removeTimer(int index) {
    final newList = List<TimerModel>.from(state)..removeAt(index);
    emit(newList);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class TrainingModel {
  final String workoutType;
  final int duration;
  final String location;
  final int intensity; 
  final int bodyFeel;
  final String note;
  final DateTime date;

  TrainingModel({
    required this.workoutType,
    required this.duration,
    required this.location,
    required this.intensity,
    required this.bodyFeel,
    required this.note,
    required this.date,
  });
}


class TrainingCubit extends Cubit<Map<DateTime, List<TrainingModel>>> {
  TrainingCubit() : super({});

  void addTraining(TrainingModel training) {
    final day = DateTime(training.date.year, training.date.month, training.date.day);
    final list = List<TrainingModel>.from(state[day] ?? []);
    list.add(training);
    emit({...state, day: list});
  }

  List<TrainingModel> getTrainingsForDay(DateTime date) {
    final day = DateTime(date.year, date.month, date.day);
    return state[day] ?? [];
  }
}

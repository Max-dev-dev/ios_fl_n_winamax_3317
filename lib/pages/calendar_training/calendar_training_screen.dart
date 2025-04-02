// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ios_fl_n_winamax_3317/cubit/training_cubit/training_cubit.dart';
import 'package:logger/logger.dart';

final logger = Logger();

class CalendarTrainingScreen extends StatefulWidget {
  const CalendarTrainingScreen({super.key});

  @override
  State<CalendarTrainingScreen> createState() => _CalendarTrainingScreenState();
}

class _CalendarTrainingScreenState extends State<CalendarTrainingScreen> {
  late DateTime _selectedDate;
  late List<DateTime> _currentTwoWeeks;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _currentTwoWeeks = _generateTwoWeeks(_selectedDate);
  }

  List<DateTime> _generateTwoWeeks(DateTime currentDate) {
    final firstDayOfWeek = currentDate.subtract(
      Duration(days: currentDate.weekday - 1),
    );
    return List.generate(
      14,
      (index) => firstDayOfWeek.add(Duration(days: index)),
    );
  }

  Widget _buildDayItem(DateTime date) {
    final isSelected =
        date.day == _selectedDate.day &&
        date.month == _selectedDate.month &&
        date.year == _selectedDate.year;

    return GestureDetector(
      onTap: () => setState(() => _selectedDate = date),
      child: Container(
        width: 50,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFB9B9B9) : Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              DateFormat('d').format(date),
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              DateFormat('E').format(date),
              style: TextStyle(
                color: isSelected ? Colors.black : Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MY TRAINING',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'CALENDAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      AddTrainingScreen(date: _selectedDate),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      _currentTwoWeeks.map((date) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: _buildDayItem(date),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 48),

              BlocBuilder<TrainingCubit, Map<DateTime, List<TrainingModel>>>(
                builder: (context, state) {
                  final trainings = context
                      .read<TrainingCubit>()
                      .getTrainingsForDay(_selectedDate);

                  if (trainings.isEmpty) {
                    return const Center(
                      child: Text(
                        'NO DATA',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.builder(
                        itemCount: trainings.length,
                        itemBuilder: (context, index) {
                          final training = trainings[index];
                          final isLast = index == trainings.length - 1;
                      
                          logger.i(
                            'Training #$index:\n'
                            'Type: ${training.workoutType}\n'
                            'Location: ${training.location}\n'
                            'Duration: ${training.duration} min\n'
                            'Intensity: ${training.intensity} (${_intensityToText(training.intensity)})\n'
                            'BodyFeel: ${training.bodyFeel} (${_bodyFeelToText(training.bodyFeel)})\n'
                            'Note: ${training.note}\n'
                            'Date: ${training.date.toIso8601String()}',
                          );
                      
                          return Padding(
                            padding: EdgeInsets.only(bottom: isLast ? 100 : 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// Type | Location | Duration
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${training.workoutType} | ${training.location}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '${training.duration} min',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                      
                                  /// Intensity
                                  Text(
                                    'Session Intensity',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    _intensityToText(training.intensity),
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                      
                                  /// Body Feel
                                  Text(
                                    'Body Feel (Energy / Recovery)',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    _bodyFeelToText(training.bodyFeel),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                      
                                  /// Note
                                  Text(
                                    training.note,
                                    style: const TextStyle(
                                      color: Color(0xFF929292),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _intensityToText(int value) {
    switch (value) {
      case 0:
        return 'Very Low';
      case 1:
        return 'Low';
      case 2:
        return 'Normal';
      case 3:
        return 'High';
      case 4:
        return 'Extreme';
      default:
        return 'Unknown';
    }
  }

  String _bodyFeelToText(int value) {
    switch (value) {
      case 0:
        return 'Very Tired';
      case 1:
        return 'Tired';
      case 2:
        return 'Normal';
      case 3:
        return 'Energized';
      case 4:
        return 'Supercharged';
      default:
        return 'Unknown';
    }
  }
}

class AddTrainingScreen extends StatefulWidget {
  final DateTime date;

  const AddTrainingScreen({super.key, required this.date});

  @override
  State<AddTrainingScreen> createState() => _AddTrainingScreenState();
}

class _AddTrainingScreenState extends State<AddTrainingScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _workoutType;
  int? _duration;
  String? _location;
  double _intensity = 0;
  double _bodyFeel = 2;
  String _note = '';

  bool get _isFilled =>
      _workoutType != null && _duration != null && _location != null;

  bool _hasChanges() =>
      _workoutType != null ||
      _duration != null ||
      _location != null ||
      _note.isNotEmpty ||
      _intensity != 0 ||
      _bodyFeel != 2;

  Future<bool> _onWillPop() async {
    if (!_hasChanges()) return true;

    final shouldLeave = await showDialog<bool>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Unsaved Changes'),
            backgroundColor: Color(0xFFF2F2F2),
            content: const Text(
              'You have unsaved changes. Are you sure you want to leave?',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text(
                  'Leave',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
    );

    return shouldLeave ?? false;
  }

  void _saveTraining() {
    if (!_isFilled) return;

    final model = TrainingModel(
      workoutType: _workoutType!,
      duration: _duration!,
      location: _location!,
      intensity: _intensity.toInt(),
      bodyFeel: _bodyFeel.toInt(),
      note: _note,
      date: widget.date,
    );

    context.read<TrainingCubit>().addTraining(model);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 24,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white24),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Training Log',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final shouldClose = await _onWillPop();
                          if (shouldClose) Navigator.pop(context);
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  _buildDropdown(
                    fieldName: 'Workout Type',
                    label: 'Workout Type',
                    value: _workoutType,
                    items: [
                      'Strength Training',
                      'Cardio',
                      'HIIT',
                      'Yoga',
                      'Pilates',
                      'CrossFit',
                      'Running',
                      'Cycling',
                      'Swimming',
                      'Stretching',
                      'Bodyweight Workout',
                      'Treadmill',
                      'Elliptical',
                      'Stair Climber',
                      'Rowing Machine',
                      'Outdoor Walk',
                      'Hiking',
                      'Boxing',
                      'Dance Workout',
                      'Mobility',
                    ],
                    onChanged: (v) => setState(() => _workoutType = v),
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    fieldName: 'Duration',
                    label: 'Duration',
                    suffix: 'Min',
                    keyboardType: TextInputType.number,
                    digitsOnly: true,
                    onChanged:
                        (v) => setState(() => _duration = int.tryParse(v)),
                  ),
                  const SizedBox(height: 12),
                  _buildDropdown(
                    fieldName: 'Training Location',
                    label: 'Training Location',
                    value: _location,
                    items: ['Gym', 'Outdoor', 'Home'],
                    onChanged: (v) => setState(() => _location = v),
                  ),
                  const SizedBox(height: 16),
                  _buildSlider(
                    label: 'Session Intensity',
                    value: _intensity,
                    onChanged: (v) => setState(() => _intensity = v),
                    labels: [
                      'Low',
                      'Medium-Low',
                      'Medium',
                      'Medium-High',
                      'High',
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSlider(
                    label: 'Body Feel (Energy / Recovery)',
                    value: _bodyFeel,
                    onChanged: (v) => setState(() => _bodyFeel = v),
                    labels: ['Very Bad', 'Bad', 'Normal', 'Good', 'Great'],
                  ),
                  const SizedBox(height: 16),
                  _buildNoteField(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isFilled ? _saveTraining : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _isFilled ? Colors.transparent : Color(0xFFD9D9D9),
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: Color(0xFFD9D9D9),
                        disabledForegroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String fieldName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: TextStyle(color: Colors.white)),
        SizedBox(height: 10.0),
        DropdownButtonFormField<String>(
          value: value,
          dropdownColor: Colors.grey[850],
          isExpanded: true,
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
          iconEnabledColor: Colors.white,
          items:
              items
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    String? suffix,
    TextInputType? keyboardType,
    required String fieldName,
    required Function(String) onChanged,
    bool digitsOnly = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 10.0),
        TextFormField(
          keyboardType: digitsOnly ? TextInputType.number : keyboardType,
          inputFormatters:
              digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
          onChanged: onChanged,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            suffixText: suffix,
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSlider({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
    required List<String> labels,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Slider(
                value: value,
                onChanged: onChanged,
                min: 0,
                max: (labels.length - 1).toDouble(),
                divisions: labels.length - 1,
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
              ),
              Text(
                labels[value.toInt()],
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNoteField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Notes', style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 4,
          style: const TextStyle(color: Colors.white),
          onChanged: (v) => setState(() => _note = v),

          decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_fl_n_winamax_3317/cubit/timer_cubit/timer_cubit.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'TIMER SETUP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
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
                              builder: (context) => const AddTimerScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Timer List
              Expanded(
                child: BlocBuilder<TimerCubit, List<TimerModel>>(
                  builder: (context, timers) {
                    if (timers.isEmpty) {
                      return const Center(
                        child: Text(
                          'NO TIMERS',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: timers.length,
                      itemBuilder: (context, index) {
                        final timer = timers[index];
                        final isLast = index == timers.length - 1;

                        return Padding(
                          padding: EdgeInsets.only(bottom: isLast ? 100 : 16),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TimerRunScreen(timer: timer),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        timer.name.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(timer.workDuration),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Rest Duration',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        _formatDuration(timer.restDuration),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Rounds',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        '${timer.rounds}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    return duration.inMinutes > 0
        ? '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}'
        : '00:${duration.inSeconds.toString().padLeft(2, '0')}';
  }
}

class AddTimerScreen extends StatefulWidget {
  const AddTimerScreen({super.key});

  @override
  State<AddTimerScreen> createState() => _AddTimerScreenState();
}

class _AddTimerScreenState extends State<AddTimerScreen> {
  String _name = 'New timer';
  int _workSeconds = 45;
  int _restSeconds = 10;
  int _rounds = 15;
  bool _isChanged = false;

  void _showExitConfirmation() {
    showDialog(
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
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
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
  }

  void _increment(Function updater) {
    setState(() {
      updater();
      _isChanged = true;
    });
  }

  Widget _buildTimerAdjust(
    String label,
    int value,
    VoidCallback inc,
    VoidCallback dec,
  ) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Row(
          children: [
            _circleButton(Icons.remove, dec),
            Expanded(
              child: Column(
                children: [
                  Text(
                    label == 'ROUNDS'
                        ? value.toString()
                        : '00:${value.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ],
              ),
            ),
            _circleButton(Icons.add, inc),
          ],
        ),
        SizedBox(height: 20.0),
        const Divider(color: Colors.white24, thickness: 1),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onTap,
      ),
    );
  }

  void _saveTimer() {
    final timer = TimerModel(
      name: _name,
      workDuration: Duration(seconds: _workSeconds),
      restDuration: Duration(seconds: _restSeconds),
      rounds: _rounds,
    );

    context.read<TimerCubit>().addTimer(timer);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isChanged) {
          _showExitConfirmation();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
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
                      child: Text(
                        'new Timer'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_isChanged) {
                          _showExitConfirmation();
                        } else {
                          Navigator.pop(context);
                        }
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

                /// Name input
                const Text(
                  'Timer name',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: _name,
                  onChanged: (val) {
                    setState(() {
                      _name = val;
                      _isChanged = true;
                    });
                  },
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// Duration controls
                _buildTimerAdjust(
                  'WORK DURATION',
                  _workSeconds,
                  () => _increment(() => _workSeconds += 5),
                  () => _increment(() {
                    if (_workSeconds > 5) _workSeconds -= 5;
                  }),
                ),
                _buildTimerAdjust(
                  'REST DURATION',
                  _restSeconds,
                  () => _increment(() => _restSeconds += 5),
                  () => _increment(() {
                    if (_restSeconds > 5) _restSeconds -= 5;
                  }),
                ),
                _buildTimerAdjust(
                  'ROUNDS',
                  _rounds,
                  () => _increment(() => _rounds++),
                  () => _increment(() {
                    if (_rounds > 1) _rounds--;
                  }),
                ),

                const SizedBox(height: 20),

                /// Save Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,
                      disabledBackgroundColor: const Color(0xFFD9D9D9),
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerRunScreen extends StatefulWidget {
  final TimerModel timer;

  const TimerRunScreen({super.key, required this.timer});

  @override
  State<TimerRunScreen> createState() => _TimerRunScreenState();
}

class _TimerRunScreenState extends State<TimerRunScreen> {
  late int _currentRound;
  late bool _isWork;
  late Duration _currentDuration;
  Timer? _timer;
  bool _isRunning = false;
  bool _isFinished = false;
  bool _isPaused = false;

  @override
  void initState() {
    super.initState();
    _currentRound = 1;
    _isWork = true;
    _currentDuration = widget.timer.workDuration;
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isPaused) return;

      if (_currentDuration.inSeconds == 0) {
        if (_isWork) {
          _isWork = false;
          _currentDuration = widget.timer.restDuration;
        } else {
          _currentRound++;
          if (_currentRound > widget.timer.rounds) {
            _finishTimer();
            return;
          }
          _isWork = true;
          _currentDuration = widget.timer.workDuration;
        }
      } else {
        setState(() {
          _currentDuration -= const Duration(seconds: 1);
        });
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = true;
    });
  }

  void _resumeTimer() {
    setState(() {
      _isPaused = false;
    });
  }

  void _finishTimer() {
    _timer?.cancel();
    setState(() {
      _isFinished = true;
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    return d.inMinutes.toString().padLeft(2, '0') +
        ':' +
        (d.inSeconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white24),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      widget.timer.name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
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
              const SizedBox(height: 48),

              /// Round info
              Center(
                child: Column(
                  children: [
                    Text(
                      _isFinished
                          ? ''
                          : '$_currentRound/${widget.timer.rounds}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _isFinished ? '' : 'ROUNDS',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Column(
                  children: [
                    Text(
                      _formatDuration(_currentDuration),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _isFinished ? 40 : 70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (!_isFinished)
                      Text(
                        _isWork ? 'WORK' : 'REST',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),

              const Spacer(),

              /// Start / Pause / Resume / Finish button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed:
                      _isFinished
                          ? () => Navigator.pop(context)
                          : _isRunning
                          ? (_isPaused ? _resumeTimer : _pauseTimer)
                          : _startTimer,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _isFinished
                        ? 'Finish Timer'
                        : _isRunning
                        ? (_isPaused ? 'Resume' : 'Pause')
                        : 'Start',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

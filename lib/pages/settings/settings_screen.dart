// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_fl_n_winamax_3317/cubit/timer_cubit/timer_cubit.dart';
import 'package:ios_fl_n_winamax_3317/cubit/training_cubit/training_cubit.dart';
import 'package:ios_fl_n_winamax_3317/services/audio_service.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isMusicOn = AudioManager().isMusicOn;
  bool isSoundOn = true;
  bool isNotificationsOn = false;

final logger = Logger();

void _resetData() {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      backgroundColor: const Color(0xFFF2F2F2),
      title: const Text('Reset All Data'),
      content: const Text(
        'This will permanently delete all saved timers and trainings.\nAre you sure you want to proceed?',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
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
          onPressed: () {
            Navigator.pop(context);

            context.read<TimerCubit>().emit([]);
            logger.i("All timers have been deleted.");

            context.read<TrainingCubit>().emit({});
            logger.i("All trainings have been deleted.");

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "All data has been reset.",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
          child: const Text(
            'Reset',
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


  void _shareApp() {
    Share.share(
      "🔥 Discover Winmax: Path to Performance — the ultimate app to fuel your fitness journey!\n\n"
      "Get inspired by real athlete stories, master your mindset, and track your progress like a pro. "
      "Whether you're into football, hockey, basketball, or just love to train smart — this app has your back.\n\n"
      "✅ Built-in interval timer\n"
      "✅ Training log & calendar\n"
      "✅ Powerful micro-articles on sport, mindset & recovery\n\n"
      "Level up your routine — download now:\nhttps://example.com",
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF929292)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SwitchListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        value: value,
        activeColor: Colors.red,
        inactiveTrackColor: Colors.white24,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildButtonTile(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF929292)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            _buildSwitchTile("Music", isMusicOn, (value) {
              setState(() {
                isMusicOn = value;
              });
              AudioManager().toggleMusic(value);
            }),
            // _buildSwitchTile("Sound", isSoundOn, (value) {
            //   setState(() {
            //     isSoundOn = value;
            //   });
            // }),
            _buildSwitchTile("Notifications", isNotificationsOn, (value) {
              setState(() {
                isNotificationsOn = value;
              });
            }),
            const SizedBox(height: 8),
            _buildButtonTile("Reset all data", Icons.refresh, _resetData),
            _buildButtonTile("Share the app", Icons.share_outlined, _shareApp),
          ],
        ),
      ),
    );
  }
}

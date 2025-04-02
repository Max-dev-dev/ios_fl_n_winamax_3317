import 'package:flutter/material.dart';
import 'package:ios_fl_n_winamax_3317/pages/articles/articles_screen.dart';
import 'package:ios_fl_n_winamax_3317/pages/athletes/athletes_screen.dart';
import 'package:ios_fl_n_winamax_3317/pages/calendar_training/calendar_training_screen.dart';
import 'package:ios_fl_n_winamax_3317/pages/settings/settings_screen.dart';
import 'package:ios_fl_n_winamax_3317/pages/timer/timer_screen.dart';

class MenuScreen extends StatefulWidget {
  final int initialIndex;

  const MenuScreen({super.key, this.initialIndex = 0});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late int _currentIndex;

  final List<Widget> _screens = [
    CalendarTrainingScreen(),
    TimerScreen(),
    AthletesScreen(),
    ArticlesScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _screens[_currentIndex],
          Positioned(
            bottom: 40,
            left: 15,
            right: 15,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.calendar_today_outlined),
                  _buildNavItem(1, Icons.timer_outlined),
                  _buildNavItem(2, Icons.sports_tennis_outlined),
                  _buildNavItem(3, Icons.menu_book_outlined),
                  _buildNavItem(4, Icons.settings_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFF1291C) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}

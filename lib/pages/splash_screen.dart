import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ios_fl_n_winamax_3317/pages/menu_screen.dart';
import 'package:ios_fl_n_winamax_3317/pages/tutorial_screen.dart';
import 'package:ios_fl_n_winamax_3317/services/audio_service.dart';

class LaunchStateService {
  static final LaunchStateService _singleton = LaunchStateService._internal();

  bool _isFirstLaunch = true;

  factory LaunchStateService() => _singleton;

  LaunchStateService._internal();

  bool get hasJustLaunched => _isFirstLaunch;

  void completeLaunch() {
    _isFirstLaunch = false;
  }
}

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    AudioManager().init();
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _initiateLaunchFlow();
  }

  void _initiateLaunchFlow() {
    final isFirstLaunch = LaunchStateService().hasJustLaunched;

    if (isFirstLaunch) {
      LaunchStateService().completeLaunch();
    }

    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => isFirstLaunch ? IntroTutorialScreen() : MenuScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/splash.png', fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: AnimatedBuilder(
            animation: _progressController,
            builder: (context, child) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: _progressController.value,
                  minHeight: 6,
                  backgroundColor: const Color(0x66F5F5F5),
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFF1291C),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ios_fl_n_winamax_3317/pages/menu_screen.dart';

class IntroTutorialScreen extends StatefulWidget {
  const IntroTutorialScreen({super.key});

  @override
  State<IntroTutorialScreen> createState() => _IntroTutorialScreenState();
}

class _IntroTutorialScreenState extends State<IntroTutorialScreen> {
  int _currentSlide = 0;

  final List<String> _tutorialSlides = [
    'assets/images/tutorial/1.png',
    'assets/images/tutorial/2.png',
    'assets/images/tutorial/3.png',
  ];

  final List<String> _actionLabels = ["Next", "Next", "Get Started"];

  void _goToNextSlide() {
    if (_currentSlide < _tutorialSlides.length - 1) {
      setState(() {
        _currentSlide++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MenuScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(_tutorialSlides[_currentSlide], fit: BoxFit.fill),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: GestureDetector(
              onTap: _goToNextSlide,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.transparent,
                  border: Border.all(width: 2.0, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    _actionLabels[_currentSlide],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

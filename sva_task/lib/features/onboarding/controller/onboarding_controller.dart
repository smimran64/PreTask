import 'package:flutter/material.dart';

class OnboardingController {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
  }

  void nextPage(BuildContext context) {
    if (currentIndex < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // ignore: avoid_print
      print("Navigate to Login Screen");
    }
  }

  void skip(BuildContext context) {
    // ignore: avoid_print
    print("Skipped to Login");
  }
}

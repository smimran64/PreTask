import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/routes/app_routes.dart';
class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  bool get isLastPage => currentPage.value == 1;
  bool get isFirstPage => currentPage.value == 0;

  void onPageChanged(int page) {
    currentPage.value = page;
  }
  void nextPage() {
    if (currentPage.value < 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToLast() {
    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void completeOnboarding() {
    Get.toNamed(AppRoutes.signin);


    Get.snackbar(
      'Welcome!',
      'Onboarding completed successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF2563EB),
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
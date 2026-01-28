import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/features/onboarding/controller/onboarding_controller.dart';

import '../widgets/onboarding1_widgets.dart';
import '../widgets/onboarding2_widgets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  OnboardingPageOne(),
                  OnboardingPageTwo(),
                ],
              ),
            ),
            Obx(() => _buildPageIndicator(size, controller)),
            Obx(() => CustomButton(
              label: controller.isLastPage ? 'Get Started' : 'Next',            
              onPressed: () {
                if (controller.isLastPage) {
                  controller.completeOnboarding();
                } else {
                  controller.nextPage();
                }
              }
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator(Size size, OnboardingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.025),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          2,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            height: size.height * 0.01,
            width: controller.currentPage.value == index
                ? size.width * 0.06
                : size.height * 0.01,
            decoration: BoxDecoration(
              color: controller.currentPage.value == index
                  ? const Color(0xFF2563EB)
                  : const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }  
}
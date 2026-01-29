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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: size.height * 0.6,
                          child: PageView(
                            controller: controller.pageController,
                            onPageChanged: controller.onPageChanged,
                            children: const [
                              OnboardingPageOne(),
                              OnboardingPageTwo(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Obx(() => _buildPageIndicator(size, controller)),
                              const SizedBox(height: 20),
                              Obx(() => CustomButton(
                                  label: controller.isLastPage
                                      ? 'Get Started'
                                      : 'Next',
                                  onPressed: () {
                                    if (controller.isLastPage) {
                                      controller.completeOnboarding();
                                    } else {
                                      controller.nextPage();
                                    }
                                  })),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPageIndicator(Size size, OnboardingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: controller.currentPage.value == index ? 24 : 8,
          decoration: BoxDecoration(
            color: controller.currentPage.value == index
                ? const Color(0xFF2563EB)
                : const Color(0xFFE5E7EB),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

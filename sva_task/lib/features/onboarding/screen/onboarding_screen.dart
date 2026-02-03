import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sva_task/routes/app_routes.dart';
import 'package:sva_task/core/common_widgets/custom_button.dart';
import 'package:sva_task/core/constants/image_path.dart';
import 'package:sva_task/features/onboarding/controller/onboarding_controller.dart';
import 'package:sva_task/features/onboarding/widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 28, 82),
      body: Stack(
        children: [
          PageView(
            controller: _controller.pageController,
            onPageChanged: (index) {
              setState(() => _controller.onPageChanged(index));
            },
            children: [
              OnboardingContent(
                image: ImagePath.onboarding1,
                title: "Discover the world, one journey at a time.",
                description: "From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today.",
              ),
              OnboardingContent(
                image: ImagePath.onboarding2,
                title: "Explore new horizons, one step at a time.",
                description: "Every trip holds a story waiting to be lived. Let us guide you to experiences that inspire, connect, and last a lifetime.",
              ),
              OnboardingContent(
                image: ImagePath.onboarding3,
                title: "See the best of the journey at a time.",
                description:
                    "Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.",
              ),
            ],
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => Get.toNamed(AppRoutes.location),
              child: const Text("Skip", style: TextStyle(color: Colors.white)),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => buildDot(index)),
                ),
                const SizedBox(height:42),
                CustomButton(
                  text: _controller.currentIndex == 2 ? "Get Started" : "Next",
                  backgroundColor: Colors.blueAccent,
                  onPressed: () {
                    if (_controller.currentIndex == 2) {
                      Get.toNamed(AppRoutes.location);
                    } else {
                      _controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: _controller.currentIndex == index ? 20 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: _controller.currentIndex == index
            ? Colors.blueAccent
            : Colors.grey,
      ),
    );
  }
}

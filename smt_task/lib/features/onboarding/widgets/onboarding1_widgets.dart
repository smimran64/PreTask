import 'package:flutter/material.dart';
import 'package:smt_task/core/constant/image_path.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Flexible(
            flex: 4,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: size.height * 0.35,
                maxWidth: double.infinity,
              ),
              child: Image.asset(
                ImagePath.onboarding,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.04),
          Text(
            'Best online courses\nin the world',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.028,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1F2937),
              height: 1.3,
            ),
          ),

          SizedBox(height: size.height * 0.02),
          Text(
            'Now you can learn anywhere, anytime, even if\nthere is no internet access!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.017,
              color: const Color(0xFF6B7280),
              height: 1.5,
            ),
          ),

          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
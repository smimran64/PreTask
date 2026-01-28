import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smt_task/core/constant/image_path.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImagePath.splash, height: 118, width: 114),
        const SizedBox(height: 24),
        const Text(
          'Theory test in my language',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'I must write the real test will be in English language and this app just helps you to understand the materials in your language',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13),
          ),
        ),
        const SizedBox(height: 80),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SpinKitCircle(color: Colors.blueAccent, size: 80),
        ),
      ],
    );
  }
}

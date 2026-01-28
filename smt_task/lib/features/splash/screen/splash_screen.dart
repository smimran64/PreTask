import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:smt_task/features/splash/controller/splash_controller.dart';
import 'package:smt_task/features/splash/widgets/splash_widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SplashBody()));
  }
}

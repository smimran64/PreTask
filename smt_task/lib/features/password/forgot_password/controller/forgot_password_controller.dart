import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  Future<void> sendVerificationCode() async {
  if (!formKey.currentState!.validate()) return;
  if (isLoading.value) return;

  try {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    Get.snackbar(
      'Success',
      'Verification code sent to ${emailController.text}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );

    Get.toNamed(AppRoutes.verifycode);

  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to send verification code. Please try again.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  } finally {
    isLoading.value = false;
  }
}
  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
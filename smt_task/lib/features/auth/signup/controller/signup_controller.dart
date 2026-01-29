import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/features/auth/signup/widgets/success_dialoguebox.dart';

class SignUpController extends GetxController {
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxString passwordStrength = ''.obs;

  bool get isFormValid =>
      emailController.text.isNotEmpty &&
      fullNameController.text.isNotEmpty &&
      passwordController.text.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(_updatePasswordStrength);
  }

  void _updatePasswordStrength() {
    final password = passwordController.text;
    if (password.isEmpty) {
      passwordStrength.value = '';
      return;
    }

    if (password.length < 8) {
      passwordStrength.value = 'Weak';
    } else if (!password.contains(RegExp(r'[A-Za-z]')) ||
        !password.contains(RegExp(r'\d'))) {
      passwordStrength.value = 'Medium';
    } else {
      passwordStrength.value = 'Strong';
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

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

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Full name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    final passwordRegex = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)',
    );
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain letters and numbers';
    }
    return null;
  }

  void signUp() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    showSuccessRegistrationDialog();
  }

  void navigateToSignIn() {
    Get.back();
  }

  void clearFields() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
    passwordStrength.value = '';
  }

  @override
  void onClose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyCodeController extends GetxController {
  final List<TextEditingController> otpControllers = 
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = 
      List.generate(4, (_) => FocusNode());

  final RxBool isLoading = false.obs;
  final RxInt remainingTime = 60.obs;
  final RxString email = ''.obs;
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    email.value = Get.arguments ?? 'pristia@gmail.com';
    startTimer();
  }

  void startTimer() {
    remainingTime.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        timer.cancel();
      }
    });
  }
  void onNumberTap(String number) {
    for (int i = 0; i < 4; i++) {
      if (otpControllers[i].text.isEmpty) {
        otpControllers[i].text = number;
        if (i < 3) {
          otpFocusNodes[i + 1].requestFocus();
        } else {
          verifyOTP();
        }
        break;
      }
    }
  }

  void onBackspace() {
    for (int i = 3; i >= 0; i--) {
      if (otpControllers[i].text.isNotEmpty) {
        otpControllers[i].clear();
        if (i > 0) {
          otpFocusNodes[i - 1].requestFocus();
        }
        break;
      }
    }
  }

  String getOTP() {
    return otpControllers.map((c) => c.text).join();
  }

  Future<void> verifyOTP() async {
    final otp = getOTP();
    if (otp.length != 4) {
      Get.snackbar(
        'Error',
        'Please enter complete OTP code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      await Future.delayed(const Duration(seconds: 2));

      Get.toNamed('/reset-password', arguments: email.value);

    } catch (e) {
      Get.snackbar(
        'Error',
        'Invalid verification code. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      clearOTP();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendCode() async {
    if (remainingTime.value > 0) {
      Get.snackbar(
        'Info',
        'Please wait ${remainingTime.value} seconds before resending',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    try {
     
      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        'Success',
        'Verification code sent',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );

      startTimer();
      clearOTP();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to resend code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    }
  }

  void clearOTP() {
    for (var controller in otpControllers) {
      controller.clear();
    }
    otpFocusNodes[0].requestFocus();
  }

  String get formattedTime {
    int minutes = remainingTime.value ~/ 60;
    int seconds = remainingTime.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in otpFocusNodes) {
      node.dispose();
    }
    super.onClose();
  }
}
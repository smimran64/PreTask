import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/core/common/widgets/custom_text_field.dart';
import 'package:smt_task/core/common/widgets/password_indicator.dart';
import 'package:smt_task/routes/app_routes.dart';
import '../controller/signup_controller.dart';

class SignUpFormBody extends StatelessWidget {
  const SignUpFormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignUpController>();
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          iconSize: 24,
          color: const Color(0xFF1F2937),
        ),
        SizedBox(height: size.height * 0.03),
        const Text(
          'Welcome to Eduline',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        Text(
          'Let\'s join to Eduline learning ecosystem & meet our professional mentor. It\'s Free!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
        ),
        SizedBox(height: size.height * 0.04),
        CustomTextField(
          controller: controller.emailController,
          label: 'Email Address',
          hintText: 'pristia@gmail.com',
          keyboardType: TextInputType.emailAddress,
          validator: controller.validateEmail,
        ),
        SizedBox(height: size.height * 0.025),
        CustomTextField(
          controller: controller.fullNameController,
          label: 'Full Name',
          hintText: 'Pristia Candra',
          keyboardType: TextInputType.name,
          validator: controller.validateFullName,
        ),
        SizedBox(height: size.height * 0.025),
        Obx(() => CustomTextField(
              controller: controller.passwordController,
              label: 'Password',
              hintText: '••••••••',
              isPassword: true,
              isPasswordVisible: controller.isPasswordVisible.value,
              onTogglePassword: controller.togglePasswordVisibility,
              validator: controller.validatePassword,
            )),
        Obx(() => PasswordStrengthIndicator(
              strength: controller.passwordStrength.value,
            )),
        SizedBox(height: size.height * 0.04),
        Obx(() => CustomButton(
              label: controller.isLoading.value
                  ? 'Creating Account...'
                  : 'Sign Up',
              onPressed: controller.isLoading.value ? null : controller.signUp,
            )),
        SizedBox(height: size.height * 0.02),
        _buildFooter(controller),
      ],
    );
  }

  Widget _buildFooter(SignUpController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.signin),
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

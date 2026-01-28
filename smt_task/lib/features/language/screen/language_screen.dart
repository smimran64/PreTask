import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/features/language/controller/language_controller.dart';
import 'package:smt_task/features/language/widgets/language_header.dart';
import 'package:smt_task/features/language/widgets/language_item.dart';
import 'package:smt_task/routes/app_routes.dart';


class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});

  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFF1A1A1A)),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LanguageHeaderWidget(),
                    const SizedBox(height: 24),
                    Obx(() => ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.languages.length,
                          itemBuilder: (context, index) {
                            final language = controller.languages[index];
                            return LanguageItemWidget(
                              language: language,
                              onTap: () => controller.selectLanguage(language),
                            );
                          },
                        )),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  )
                  ,
                ],
              ),

             
            ),

            const SizedBox(height: 16),

            CustomButton(label: 'Continue', onPressed: ()=> Get.toNamed(AppRoutes.productList))
          ],
        ),
      ),
    );
  }

  
}
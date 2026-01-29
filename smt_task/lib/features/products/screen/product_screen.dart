import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smt_task/features/products/controller/product_controller.dart';
import 'package:smt_task/features/products/widgets/edit_widgets.dart';
import 'package:smt_task/features/products/widgets/product_card_list.dart';
import 'package:smt_task/features/products/widgets/product_form.dart';

class ProductListScreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0XFF1B6EF7),
        onPressed: () => Get.to(() => const ProductForm()),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return ProductCard(
                  product: product,
                  onEdit: () {
                    controller.setEdit(product);
                    Get.to(() => EditProductScreen(productId: product.id!));
                  },
                  onDelete: () => _showDeleteConfirm(product.id!),
                );
              },
            )),
    );
  }

  void _showDeleteConfirm(String id) {
    Get.defaultDialog(
      title: "Are you sure?",
      middleText: "Do you want to delete this product?",
      textConfirm: "Delete",
      textCancel: "Cancel",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        controller.deleteProduct(id);
        Get.back();
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_task/core/common/widgets/custom_button_widgets.dart';
import 'package:smt_task/features/products/model/product_model.dart';
import '../controller/product_controller.dart';

class AddProductForm extends StatelessWidget {
  const AddProductForm({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ProductController>();

    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: c.addNameCtrl,
              decoration: const InputDecoration(labelText: "Product Name *"),
            ),

            Obx(() => Column(
              children: c.addData.keys.map((key) {
                return Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: c.addData[key],
                        decoration: InputDecoration(labelText: key),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => c.addData.remove(key),
                    )
                  ],
                );
              }).toList(),
            )),

            TextButton.icon(
              onPressed: () {
                final key = "field_${c.addData.length + 1}";
                c.addData[key] = TextEditingController();
              },
              icon: const Icon(Icons.add),
              label: const Text("Add Field"),
            ),
            const SizedBox(height: 12),
            CustomButton(
              label: "Save Product",
              onPressed: c.addProduct,
            ),
          ],
        ),
      ),
    );
  }
}


void showEditBottomSheet(ProductModel product) {
   final c = Get.find<ProductController>();
  c.setEdit(product); 

  Get.defaultDialog(
    title: "Edit Product",
    titlePadding: const EdgeInsets.all(16),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    content: SingleChildScrollView(
      child: Column(
        children: [
          TextField(
            controller: c.editNameCtrl,
            decoration: const InputDecoration(labelText: "Product Name"),
          ),
          const SizedBox(height: 12),

          Obx(() => Column(
            children: c.editData.keys.map((key) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: c.editData[key],
                  decoration: InputDecoration(labelText: key),
                ),
              );
            }).toList(),
          )),

          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => c.updateProduct(product.id!),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size(double.infinity, 48),
            ),
            child: const Text(
              "Update Product",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

void showAddProductBottomSheet() {
  final c = Get.find<ProductController>();
  c.clearAdd(); 

  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add Product",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const AddProductForm(), 
          ],
        ),
      ),
    ),
    isScrollControlled: true,
  );
}



void showDeleteConfirm(VoidCallback onConfirm) {
  Get.defaultDialog(
    title: "Confirm Delete",
    middleText: "Are you sure you want to delete this product?",
    textCancel: "Cancel",
    textConfirm: "OK",
    onConfirm: () {
      Get.back();
      onConfirm();
    },
  );
}



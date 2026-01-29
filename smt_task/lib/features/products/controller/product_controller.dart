import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:smt_task/features/products/model/product_model.dart';
import 'package:smt_task/features/products/services/product_service.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;
  var isLoading = false.obs;
  var isDeleting = false.obs;

  final addNameCtrl = TextEditingController();
  final addData = <String, TextEditingController>{}.obs;

  final editNameCtrl = TextEditingController();
  final editData = <String, TextEditingController>{}.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    isLoading(true);
    products.value = await ProductService.fetchProducts();
    isLoading(false);
  }

  Future<void> addProduct() async {
    if (addNameCtrl.text.isEmpty) {
      return;
    }

    final dataMap = {for (var e in addData.entries) e.key: e.value.text};

    await ProductService.createProduct(
      ProductModel(name: addNameCtrl.text, data: dataMap),
    );

    clearAdd();
    fetchProducts();
  }

  void setEdit(ProductModel product) {
    editNameCtrl.text = product.name;
    editData.clear();

    product.data?.forEach((key, value) {
      editData[key] = TextEditingController(text: value.toString());
    });
  }

  Future<void> updateProduct(String id) async {
    final dataMap = {for (var e in editData.entries) e.key: e.value.text};

    await ProductService.updateProduct(
      id,
      ProductModel(name: editNameCtrl.text, data: dataMap),
    );

    fetchProducts();
    Get.back();
  }

  Future<void> deleteProduct(String id) async {
    if (isDeleting.value) return;

    isDeleting(true);
    await ProductService.deleteProduct(id);
    isDeleting(false);

    fetchProducts();
  }

  void clearAdd() {
    addNameCtrl.clear();
    addData.clear();
  }
}

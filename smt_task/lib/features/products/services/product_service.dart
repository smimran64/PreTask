import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';

class ProductService {
  static const String baseUrl = 'https://api.restful-api.dev/objects';

  static Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    final List data = jsonDecode(response.body);
    return data.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> createProduct(ProductModel product) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );
  }

  static Future<void> updateProduct(String id, ProductModel product) async {
    await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(product.toJson()),
    );
  }

  static Future<void> deleteProduct(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}

class ProductModel {
  final String? id;
  final String name;
  final Map<String, dynamic>? data;

  ProductModel({
    this.id,
    required this.name,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "data": data,
    };
  }
}

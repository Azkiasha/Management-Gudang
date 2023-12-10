import 'dart:convert';

Product warehouseFromJson(String str) => Product.fromJson(json.decode(str));

String warehouseToJson(Product data) => json.encode(data.toJson());

class Product {
  String image;
  String name;
  String description;
  double price;

  Product({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      image: json["image"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: json["price"]?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "name": name,
      "description": description,
      "price": price,
    };
  }
}

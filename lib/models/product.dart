import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart'; // replace 'your_file_name' with the name of your Dart file

@JsonSerializable()
class ProductResponse {
  final String message;
  final int count;
  final int page;
  final int success;
  final List<Product> data;
  // ... existing fields ...

  ProductResponse({
    required this.message,
    required this.count,
    required this.page,
    required this.success,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String status;
  final List<String> image_urls;
  final List<String> tags;
  final String categoryId;
  final String creator;
  final String createdAt;
  final String updatedAt;

  Product({
    this.id = '',
    this.name = '',
    this.description = '',
    this.price = 0.0,
    this.status = '',
    this.image_urls = const [],
    this.tags = const [],
    this.categoryId = '',
    this.creator = '',
    this.createdAt =
        "2000, 1, 1", // You can set a more reasonable default if desired
    this.updatedAt = "2000, 1, 1", // Same here
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

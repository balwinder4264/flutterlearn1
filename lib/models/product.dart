class ProductResponse {
  final String message;
  final int count;
  final int page;
  final int success;
  final List<Product> data;

  ProductResponse({
    required this.message,
    required this.count,
    required this.page,
    required this.success,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        message: json['message'],
        count: json['count'],
        page: json['page'],
        success: json['success'],
        data: List<Product>.from(json['data'].map((x) => Product.fromJson(x))),
      );
}

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String status;
  final List<String> imageUrls;
  final List<String> tags;
  final String categoryId;
  final String creator;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.status,
    required this.imageUrls,
    required this.tags,
    required this.categoryId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'].toDouble(),
        status: json['status'],
        imageUrls: List<String>.from(json['image_urls'].map((x) => x)),
        tags: List<String>.from(json['tags'].map((x) => x)),
        categoryId: json['category_id'],
        creator: json['creator'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        v: json['__v'],
      );
}

// To use it:
// final productResponse = ProductResponse.fromJson(jsonDecode(jsonString));

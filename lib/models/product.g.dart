// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      message: json['message'] as String,
      count: json['count'] as int,
      page: json['page'] as int,
      success: json['success'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'count': instance.count,
      'page': instance.page,
      'success': instance.success,
      'data': instance.data,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      status: json['status'] as String? ?? '',
      image_urls: (json['image_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      categoryId: json['categoryId'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? "2000, 1, 1",
      updatedAt: json['updatedAt'] as String? ?? "2000, 1, 1",
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'status': instance.status,
      'image_urls': instance.image_urls,
      'tags': instance.tags,
      'categoryId': instance.categoryId,
      'creator': instance.creator,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class Category {
  @JsonKey(name: '_id')
  final String id;

  final String name;
  final String? description;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  final String active;

  @JsonKey(name: 'parent_category_id')
  final String? parentCategoryId;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
    required this.active,
    this.parentCategoryId,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

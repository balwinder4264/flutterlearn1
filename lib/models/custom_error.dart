import 'package:json_annotation/json_annotation.dart';
part 'custom_error.g.dart';

@JsonSerializable()
class CustomError {
  final String message;
  final int statusCode;
  final int success;

  CustomError({required this.message, required this.statusCode, required this.success});

  factory CustomError.fromJson(Map<String, dynamic> json) => _$CustomErrorFromJson(json);

  Map<String, dynamic> toJson() => _$CustomErrorToJson(this);
}

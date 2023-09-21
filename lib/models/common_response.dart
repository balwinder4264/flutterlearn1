import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable(explicitToJson: true, nullable: true)
class CommonResponse {
  final String message;
  final int success;

  @JsonKey(defaultValue: null)
  final dynamic data; // Could be a list, string, or object

  CommonResponse({
    required this.message,
    required this.success,
    this.data,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) =>
      _$CommonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CommonResponseToJson(this);
}

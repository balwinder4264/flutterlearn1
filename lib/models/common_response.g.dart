// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponse _$CommonResponseFromJson(Map<String, dynamic> json) =>
    CommonResponse(
      message: json['message'] as String,
      success: json['success'] as int,
      data: json['data'],
    );

Map<String, dynamic> _$CommonResponseToJson(CommonResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'data': instance.data,
    };

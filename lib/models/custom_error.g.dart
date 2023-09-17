// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomError _$CustomErrorFromJson(Map<String, dynamic> json) => CustomError(
      message: json['message'] as String,
      statusCode: json['statusCode'] as int,
      success: json['success'] as int,
    );

Map<String, dynamic> _$CustomErrorToJson(CustomError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'success': instance.success,
    };

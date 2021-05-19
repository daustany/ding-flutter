// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errorresponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponseModel _$ErrorResponseModelFromJson(Map<String, dynamic> json) {
  return ErrorResponseModel(
    code: json['code'] as int?,
    message: json['message'] as String?,
    details: json['details'] as String?,
    validationErrors: json['validationErrors'],
  );
}

Map<String, dynamic> _$ErrorResponseModelToJson(ErrorResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
      'validationErrors': instance.validationErrors,
    };

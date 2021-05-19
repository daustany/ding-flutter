// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsebody_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBodyModel _$ResponseBodyModelFromJson(Map<String, dynamic> json) {
  return ResponseBodyModel(
    result: json['result'] == null
        ? null
        : ResultResponseModel.fromJson(json['result'] as Map<String, dynamic>),
    targetUrl: json['targetUrl'],
    success: json['success'] as bool?,
    error: json['error'] == null
        ? null
        : ErrorResponseModel.fromJson(json['error'] as Map<String, dynamic>),
    unAuthorizedRequest: json['unAuthorizedRequest'] as bool?,
    abp: json['abp'] as bool?,
  );
}

Map<String, dynamic> _$ResponseBodyModelToJson(ResponseBodyModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'targetUrl': instance.targetUrl,
      'success': instance.success,
      'error': instance.error,
      'unAuthorizedRequest': instance.unAuthorizedRequest,
      'abp': instance.abp,
    };

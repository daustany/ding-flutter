import 'package:json_annotation/json_annotation.dart';
part 'errorresponse_model.g.dart';

@JsonSerializable()
class ErrorResponseModel {
  int? code;
  String? message;
  String? details;
  dynamic validationErrors;

  ErrorResponseModel({
    this.code,
    this.message,
    this.details,
    this.validationErrors,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseModelToJson(this);
}

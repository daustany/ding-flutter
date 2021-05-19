import 'package:ding/models/errorresponse_model.dart';
import 'package:ding/models/token/resultresponse_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responsebody_model.g.dart';

@JsonSerializable()
class ResponseBodyModel {
  ResultResponseModel? result;
  dynamic targetUrl;
  bool? success;
  ErrorResponseModel? error;
  bool? unAuthorizedRequest;
  bool? abp;

  ResponseBodyModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory ResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBodyModelToJson(this);
}

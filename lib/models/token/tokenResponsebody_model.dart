import 'package:ding/models/errorresponse_model.dart';
import 'package:ding/models/token/tokenresponse_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tokenResponsebody_model.g.dart';

@JsonSerializable()
class TokenResponseBodyModel {
  TokenResponseModel? result;
  dynamic targetUrl;
  bool? success;
  ErrorResponseModel? error;
  bool? unAuthorizedRequest;
  bool? abp;

  TokenResponseBodyModel({
    this.result,
    this.targetUrl,
    this.success,
    this.error,
    this.unAuthorizedRequest,
    this.abp,
  });

  factory TokenResponseBodyModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseBodyModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseBodyModelToJson(this);
}

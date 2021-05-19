import 'package:json_annotation/json_annotation.dart';
part 'resultresponse_model.g.dart';

@JsonSerializable()
class ResultResponseModel {
  String? accessToken;
  String? encryptedAccessToken;
  int? expireInSeconds;
  bool? shouldResetPassword;
  dynamic? passwordResetCode;
  int? userId;
  bool? requiresTwoFactorVerification;
  dynamic? twoFactorAuthProviders;
  dynamic? twoFactorRememberClientToken;
  dynamic? returnUrl;
  String? refreshToken;
  int? refreshTokenExpireInSeconds;

  ResultResponseModel({
    this.accessToken,
    this.encryptedAccessToken,
    this.expireInSeconds,
    this.shouldResetPassword,
    this.passwordResetCode,
    this.userId,
    this.requiresTwoFactorVerification,
    this.twoFactorAuthProviders,
    this.twoFactorRememberClientToken,
    this.returnUrl,
    this.refreshToken,
    this.refreshTokenExpireInSeconds,
  });

  factory ResultResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResponseModelToJson(this);
}

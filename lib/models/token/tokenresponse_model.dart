import 'package:json_annotation/json_annotation.dart';
part 'tokenresponse_model.g.dart';

@JsonSerializable()
class TokenResponseModel {
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

  TokenResponseModel({
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

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}

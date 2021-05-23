// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokenresponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponseModel _$TokenResponseModelFromJson(Map<String, dynamic> json) {
  return TokenResponseModel(
    accessToken: json['accessToken'] as String?,
    encryptedAccessToken: json['encryptedAccessToken'] as String?,
    expireInSeconds: json['expireInSeconds'] as int?,
    shouldResetPassword: json['shouldResetPassword'] as bool?,
    passwordResetCode: json['passwordResetCode'],
    userId: json['userId'] as int?,
    requiresTwoFactorVerification:
        json['requiresTwoFactorVerification'] as bool?,
    twoFactorAuthProviders: json['twoFactorAuthProviders'],
    twoFactorRememberClientToken: json['twoFactorRememberClientToken'],
    returnUrl: json['returnUrl'],
    refreshToken: json['refreshToken'] as String?,
    refreshTokenExpireInSeconds: json['refreshTokenExpireInSeconds'] as int?,
    tenantId: json['tenantId'] as int?,
  );
}

Map<String, dynamic> _$TokenResponseModelToJson(TokenResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'encryptedAccessToken': instance.encryptedAccessToken,
      'expireInSeconds': instance.expireInSeconds,
      'shouldResetPassword': instance.shouldResetPassword,
      'passwordResetCode': instance.passwordResetCode,
      'userId': instance.userId,
      'requiresTwoFactorVerification': instance.requiresTwoFactorVerification,
      'twoFactorAuthProviders': instance.twoFactorAuthProviders,
      'twoFactorRememberClientToken': instance.twoFactorRememberClientToken,
      'returnUrl': instance.returnUrl,
      'refreshToken': instance.refreshToken,
      'refreshTokenExpireInSeconds': instance.refreshTokenExpireInSeconds,
      'tenantId': instance.tenantId,
    };

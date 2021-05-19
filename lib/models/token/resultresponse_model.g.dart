// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultresponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponseModel _$ResultResponseModelFromJson(Map<String, dynamic> json) {
  return ResultResponseModel(
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
  );
}

Map<String, dynamic> _$ResultResponseModelToJson(
        ResultResponseModel instance) =>
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
    };

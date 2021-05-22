import 'dart:async';

import 'package:ding/data/network/apis/authentication/tokenAuth.dart';
import 'package:ding/data/sharedpref/shared_preference_helper.dart';
import 'package:ding/models/token/tokenResponsebody_model.dart';

class Repository {
  // data source object

  // api objects
  final TokenAuth _tokenAuth;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._tokenAuth, this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  Future<TokenResponseBodyModel> login(
    String tenant,
    String username,
    String password,
  ) async {
    return await _tokenAuth
        .authenticate(tenant, username, password)
        .then((result) {
      return result;
    }).catchError((error) => throw Exception(error.message));
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<String?> authToken(bool value) {
    return _sharedPrefsHelper.authToken;
  }

  Future<void> saveAuthToken(
    String? tanantId,
    String? authToken,
    String? encryptedAccessToken,
    String? refreshToken,
  ) =>
      _sharedPrefsHelper.saveAuthToken(
        tanantId,
        authToken,
        encryptedAccessToken,
        refreshToken,
      );

  Future<bool> removeAuthToken() {
    return _sharedPrefsHelper.removeAuthToken();
  }

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}

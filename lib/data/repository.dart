import 'dart:async';

import 'package:ding/data/network/apis/authentication/tokenAuth.dart';
import 'package:ding/data/sharedpref/shared_preference_helper.dart';
import 'package:ding/models/responsebody_model.dart';

class Repository {
  // data source object

  // api objects
  final TokenAuth _tokenAuth;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._tokenAuth, this._sharedPrefsHelper);

  // Login:---------------------------------------------------------------------
  Future<ResponseBodyModel> login(String email, String password) async {
    return await _tokenAuth.authenticate(email, password);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<String?> authToken(bool value) {
    return _sharedPrefsHelper.authToken;
  }

  Future<void> saveAuthToken(String? authToken, String? encryptedAccessToken,
          String? refreshToken) =>
      _sharedPrefsHelper.saveAuthToken(
          authToken, encryptedAccessToken, refreshToken);

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

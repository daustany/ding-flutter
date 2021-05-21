import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

@Singleton()
class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.auth_token);
  }

  Future<bool> saveAuthToken(
    String? tanantId,
    String? authToken,
    String? encryptedAccessToken,
    String? refreshToken,
  ) async {
    _sharedPreference.setString(Preferences.tanantId, tanantId ?? '');
    _sharedPreference.setString(Preferences.auth_token, authToken ?? '');
    _sharedPreference.setString(
        Preferences.encrypted_auth_token, encryptedAccessToken ?? '');
    return _sharedPreference.setString(
        Preferences.refresh_token, refreshToken ?? '');
  }

  Future<bool> removeAuthToken() async {
    _sharedPreference.remove(Preferences.tanantId);
    _sharedPreference.remove(Preferences.auth_token);
    _sharedPreference.remove(Preferences.encrypted_auth_token);
    return _sharedPreference.remove(Preferences.refresh_token);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.is_logged_in) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.is_logged_in, value);
  }

  // Theme:------------------------------------------------------
  bool get isDarkMode {
    return _sharedPreference.getBool(Preferences.is_dark_mode) ?? false;
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference.setBool(Preferences.is_dark_mode, value);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference.getString(Preferences.current_language);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference.setString(Preferences.current_language, language);
  }
}

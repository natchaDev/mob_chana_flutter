import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  static const PREF_ID_TOKEN = "idToken";
  static const PREF_USER_ID = "userId";
  static const PREF_MAIN_THEME = "mainTheme";
  static const PREF_LANGUAGE_VERSION = "languageVersion";

  UserPreference();

  Future<String> getIdToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_ID_TOKEN) ?? null;
  }

  Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_USER_ID) ?? null;
  }

  Future<bool> getLocalTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PREF_MAIN_THEME) ?? null;
  }

  Future<String> getLanguageVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PREF_LANGUAGE_VERSION) ?? null;
  }

  void setIdToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_ID_TOKEN, value);
  }

  void setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_USER_ID, value);
  }

  void setLocalTheme(bool isDarkTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PREF_MAIN_THEME, isDarkTheme);
  }

  void setLanguageVersion(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREF_LANGUAGE_VERSION, value);
  }
}

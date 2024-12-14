import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _tujuanIdKey = 'tujuan_id';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<void> saveUserId(int userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId.toString());
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userIdKey);
  }

  Future<void> saveTujuanId(int tujuanId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tujuanIdKey, tujuanId.toString());
  }

  Future<String?> getTujuanId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tujuanIdKey);
  }

  Future<void> clearTujuan() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tujuanIdKey);
  }
}
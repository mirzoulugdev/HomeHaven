import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences preferences;

  CacheHelper({required this.preferences});

  final String tokenKey = "token";

  Future<bool> setToken({required String token}) async {
    final result = await preferences.setString(tokenKey, token);
    return result;
  }

  String? getToken() {
    return preferences.getString(tokenKey);
  }

  Future<void> resetToken() async {
    await preferences.remove(tokenKey);
  }
}

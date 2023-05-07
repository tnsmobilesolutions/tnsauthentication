import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserPreferences {
  static const _storage = FlutterSecureStorage();

  static const _keyRememberMe = 'rememberMe';
  static const _keyEmail = 'email';
  static const _keyPassword = 'password';

  static Future<bool> get rememberMe async {
    final value = await _storage.read(key: _keyRememberMe);
    return value != null ? value.toLowerCase() == 'true' : false;
  }

  static Future<void> setRememberMe(bool value) async {
    await _storage.write(key: _keyRememberMe, value: value.toString());
  }

  static Future<String?> get email async {
    return await _storage.read(key: _keyEmail);
  }

  static Future<void> setEmail(String value) async {
    await _storage.write(key: _keyEmail, value: value);
  }

  static Future<String?> get password async {
    return await _storage.read(key: _keyPassword);
  }

  static Future<void> setPassword(String value) async {
    await _storage.write(key: _keyPassword, value: value);
  }
}

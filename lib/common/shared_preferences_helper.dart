import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Store a value in SharedPreferences
  static Future<void> setValue(String key, dynamic value) async {
    if (_preferences == null) {
      await init();
    }
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    }
  }

  // Retrieve a value from SharedPreferences
  static dynamic getValue(String key) {
    if (_preferences == null) {
      throw Exception('SharedPreferences has not been initialized');
    }
    return _preferences.get(key);
  }
}

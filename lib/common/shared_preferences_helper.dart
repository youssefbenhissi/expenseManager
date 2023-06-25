import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // ignore: constant_identifier_names
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";

  static late SharedPreferences _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Store a value in SharedPreferences
  static Future<void> setValue(String key, dynamic value) async {
    await init();
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

  static Future<bool> isFirstLaunch() async {
    await init();
    bool isFirstLaunch =
        _preferences.getBool(PREFERENCES_IS_FIRST_LAUNCH_STRING) ?? true;

    if (isFirstLaunch) {
      _preferences.setBool(PREFERENCES_IS_FIRST_LAUNCH_STRING, false);
    }

    return isFirstLaunch;
  }

  // Retrieve a value from SharedPreferences
  static dynamic getValue(String key) {
    return _preferences.get(key);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString(String key) {
    return _prefsInstance.getString(key);
  }

  static int getInt(String key) {
    return _prefsInstance.getInt(key);
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }
  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  static Future<bool> clearAll() async {
    var prefs = await _instance;
    return prefs.clear();
  }

}
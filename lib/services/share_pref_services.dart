import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  // Set Shared Preferences Data

  static Future<bool> setStringData(
      {required String key, required String value}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return await sharedPreferencesInstance.setString(key, value);
  }

  static Future<bool> setIntData({String? key, int? value}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return await sharedPreferencesInstance.setInt(key!, value!);
  }

  static Future<bool> setBoolData({String? key, bool? value}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return await sharedPreferencesInstance.setBool(key!, value!);
  }

  static Future<bool> setDoubleData({String? key, double? value}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return await sharedPreferencesInstance.setDouble(key!, value!);
  }

  // Get Shared Preferences Data

  static Future<String?> getStringData({String? key}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return sharedPreferencesInstance.getString(key!);
  }

  static Future<int?> getIntData({String? key}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return sharedPreferencesInstance.getInt(key!);
  }

  static Future<bool?> getBoolData({String? key}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return sharedPreferencesInstance.getBool(key!);
  }

  static Future<double?> getDoubleData({String? key}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return sharedPreferencesInstance.getDouble(key!);
  }

  static Future<bool> removeData({String? key}) async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    return sharedPreferencesInstance.remove(key!);
  }

  static Future clearSharedPrefData() async {
    SharedPreferences sharedPreferencesInstance =
        await SharedPreferences.getInstance();
    await sharedPreferencesInstance.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceSinglton {
  static late SharedPreferences _Prefs;

  static Future<void> init() async {
    _Prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _Prefs.setBool(key, value);
  }

  static bool getBool(String key) {
    return _Prefs.getBool(key) ?? false;
  }
    static Future<void>  setString(String key,String value) async{
    await _Prefs.setString(key,value) ;
  }
  static String? getString(String key) {
    return _Prefs.getString(key);
  }


}

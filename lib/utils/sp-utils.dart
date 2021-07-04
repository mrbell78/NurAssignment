import 'package:get_storage/get_storage.dart';

class SPUtil{
  static String KEY_AUTH_TOKEN = "KEY_AUTH_TOKEN";
  

  setValue(String key, String value) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    GetStorage().write(key, value);
  }

  deleteKey(String key) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    GetStorage().remove(key);
  }

  String getValue(String key) {
    return GetStorage().read(key);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // try {
    //   var value = prefs.getString(key);
    //   return value;
    // } catch (error) {
    //   return null;
    // }
  }
}
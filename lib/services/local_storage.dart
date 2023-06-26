import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // usar el shared_preferences para el localStorage
  static late SharedPreferences prefs;

  //configuración del shared_preferences
  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferences {
  static void setPassword({required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("password", password);
  }

  static Future<String?> getPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("password");
  }
}
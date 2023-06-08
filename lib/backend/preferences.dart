import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class simplePreferences {
  static SharedPreferences? prefs;
  static Future init() async => prefs = await SharedPreferences.getInstance();

  static Future setAllowed() async {
    await prefs?.setBool("Login", true);
  }

  static Future setNotAllowed() async {
    await prefs?.setBool("Login", false);
  }

  static bool? getAllowed() {
    return prefs?.getBool("Login");
  }

  static Future setEmail({required String email}) async {
    await prefs?.setString("email", email);
  }

  static String getEmail() {
    String val = prefs?.getString("email") ?? "";
    return val;
  }

  static Future setName({required String name}) async {
    await prefs?.setString("name", name);
  }

  static String getName() {
    String val = prefs?.getString("name") ?? "";
    return val;
  }

  static Future setRole({required String role}) async {
    await prefs?.setString("role", role);
  }

  static String getRole() {
    String val = prefs?.getString("role") ?? "";
    return val;
  }

  static Future setLevel({required String level}) async {
    await prefs?.setString("level", level);
  }

  static String getLevel() {
    String val = prefs?.getString("level") ?? "";
    return val;
  }

  static Future setCount({required int count}) async {
    await prefs?.setInt("count", count);
  }

  static int getCount() {
    int val = prefs?.getInt("count") ?? 0;
    return val;
  }

  static Future<void> clear() async {
    await prefs?.clear();
  }
}

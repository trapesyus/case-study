import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String userUid = '';
  static bool enabledPermission = false;

  static Future<void> setUid({required String userId}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('userUid', userId);
  }

  static Future<void> getUid() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String tempUserUid = sharedPreferences.getString('userUid') ?? '';
    userUid = tempUserUid;
  }

  // static Future<void> setLocationPermission({required bool permission}) async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   sharedPreferences.setBool('permission', true);
  // }

  // static Future<void> getLocationPermission() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   enabledPermission = sharedPreferences.getBool('permission') ?? false;
  // }
}

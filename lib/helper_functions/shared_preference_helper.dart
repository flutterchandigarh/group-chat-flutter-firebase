import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static String userLoggedInKey = "ISLOGGEDIN";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userUIDKey = "USERUIDKEY";
  static String userProfilePicKey = "USERPROFILEPICKEY";

  // save data to shared preference
  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return await preference.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserName(String userName) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return await preference.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return await preference.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserUID(String userUID) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return await preference.setString(userUIDKey, userUID);
  }

  static Future<bool> saveUserProfilePic(String profileUrl) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return await preference.setString(userProfilePicKey, profileUrl);
  }
}

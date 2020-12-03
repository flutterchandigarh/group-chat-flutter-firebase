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

  // get data
  static Future<bool> getUserLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedInKey) ?? false;
  }

  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userNameKey) ?? "";
  }

  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userEmailKey) ?? "";
  }

  static Future<String> getUserUID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userUIDKey) ?? "";
  }

  static Future<String> getUserProfilePic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(userProfilePicKey) ?? "";
  }

  // clear all data on sign out
  // Clear all SharedPreference data
  static clearData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}

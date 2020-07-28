import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences{
  static String SPLoginState = "loggedin";
  static String SPUsername = "UsernameKey";
  static String SPEmail = "EmailKey";

  // saving data to shared preferences

static Future<bool> saveUserLoginState(bool isLoggedin) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setBool(SPLoginState, isLoggedin);

}

  static Future<bool> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SPUsername, username);

  }


  static Future<bool> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SPEmail, email);

  }


  // getting data form shared preferences

  static Future<bool> getUserLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(SPLoginState);

  }

  static Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SPUsername);

  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SPEmail);

  }

}
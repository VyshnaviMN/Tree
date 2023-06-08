import 'package:shared_preferences/shared_preferences.dart';

// TODO: Vyshnavi and Sumanth pls check if this is working for u as well(Changed from bool to string to try and return email)
class HelperFunctions {
  static String userLoggedInKey = "";

  static saveUserLoggedInDetails({String email}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userLoggedInKey, email);
  }

  static Future<String> getUserLoggedInDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userLoggedInKey);
  }
}

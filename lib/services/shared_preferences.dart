import 'package:shared_preferences/shared_preferences.dart';

class FavouritePreferences {
  static SharedPreferences preferences;
  static const favkey = "favusers";

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setFav(String favusers) async {
    await preferences.setString(favkey, favusers);
  }

  static String getFav() {
    return preferences.getString(favkey);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class FavouritePreferences {
  static SharedPreferences preferences;
  static const favkey = "favusers";

  static Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setFav(List<String> favusers) async {
    await preferences.setStringList(favkey, favusers);
  }

  static List<String> getFav() {
    return preferences.getStringList(favkey);
  }
}

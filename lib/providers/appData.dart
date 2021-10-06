import 'package:shared_preferences/shared_preferences.dart';

class AppData {
  static String indexKey = 'indexKey';
  static String songKey = 'songKey';
  Future<bool> setIndex(int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt(indexKey, value);
  }

  Future getIndex() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(indexKey);
  }

  Future clearPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future setSong(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(songKey, value);
  }

  Future getSong() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(songKey);
  }
}

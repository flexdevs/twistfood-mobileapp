import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences sharedPreferences;
  static final LocalStorage instance = LocalStorage._();
  LocalStorage._();
  void setBool({required bool value, required String key}) =>
      sharedPreferences.setBool(key, value);
  void setString({required String value, required String key}) =>
      sharedPreferences.setString(key, value);
  void setInt({required int value, required String key}) =>
      sharedPreferences.setInt(key, value);
}

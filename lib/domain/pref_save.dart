import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PrefSave {
  Future<List<dynamic>> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await json.decode(prefs.getString(key)) as List<dynamic>;
  }

  Future save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }

  Future remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}

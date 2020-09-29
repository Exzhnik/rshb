import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefSave {
  Future<List> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(key) == null) {
      return [];
    }
    return await json.decode(prefs.getString(key)) as List;
  }

  Future save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, json.encode(value));
  }
}

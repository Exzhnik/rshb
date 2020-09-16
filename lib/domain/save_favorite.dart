import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveFavorite extends ChangeNotifier {
  String objest;

  Future<String> readPathFile() async {
    var prefs = await SharedPreferences.getInstance();
    return objest = prefs.getString('favorite') ?? '';
  }

  Future<void> savePathFile(String file) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('favorite', file);
  }
}

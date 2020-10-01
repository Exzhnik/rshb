import 'package:flutter/material.dart';

import 'theme_values.dart';

// ignore: prefer_mixin
class ThemeNotifier with ChangeNotifier {
  ThemeNotifier(this._themeData);

  ThemeData _themeData = greenTheme;

  ThemeData getTheme() => _themeData;

  Future setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
}

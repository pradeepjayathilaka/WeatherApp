import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weatherapp/services/theme_persistance.dart';
import 'package:weatherapp/utils/themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemesModeData().LightMode;

  ThemeProvider() {
    loadTheme();
  }

  final ThemePersistance _themePersistance = ThemePersistance();

//getter
  ThemeData get getTheme => _themeData;

//setter
  set setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  //Load the thme from shared preferences
  Future<void> loadTheme() async {
    bool isDark = await _themePersistance.loadTheme();
    setTheme = isDark ? ThemesModeData().darkMode : ThemesModeData().LightMode;
  }

  //toggle theme
  Future<void> toggleTheme(bool isDark) async {
    setTheme = isDark ? ThemesModeData().darkMode : ThemesModeData().LightMode;

    await _themePersistance.storeTheme(isDark);
    notifyListeners();
  }
}

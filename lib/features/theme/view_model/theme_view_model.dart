import 'package:flutter/material.dart';

class ThemeViewModel {
  String themeName;
  bool isDarkModeEnabled;
  ThemeData? themeData = ThemeData();
  bool isThemeChanged;

  ThemeViewModel({
    this.themeName = '',
    this.isDarkModeEnabled = false,
    this.themeData,
    this.isThemeChanged = false,
  });
}

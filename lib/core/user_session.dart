import 'package:clutter/core/preferences_helper.dart';
import 'package:clutter/ui_kit/cluttter_theme.dart';
import 'package:flutter/material.dart';

/// usage `_themes["light"]()`
Map<String, Function> _themes = {
  "dark_theme_key": _getDarkTheme,
  "light_theme_key": _getLightTheme,
};

ThemeData _getLightTheme() => ClutterTheme.clutterLightTheme;
ThemeData _getDarkTheme() => ClutterTheme.clutterDarkTheme;

class UserSession {
  /// These keys are stored in User's preferences
  ///  Keys are [String] and must only assume the values
  final String THEME_KEY = 'theme_key';
  PreferencesHelper _preferencesHelper = PreferencesHelper();

  List<String> getAllThemes() {
    return _themes.keys.toList();
  }

  /// It is used to set the initial data while fetching the data
  ThemeData initializeCluttterTheme() {
    return getThemeByName(
      _preferencesHelper.getValue(
        key: THEME_KEY,
        defaultValue: "dark_theme_key",
      ),
    );
  }

  ThemeData getThemeByName(String name) {
    final theme = _themes[name];
    if (theme == null) throw ThemeNotFoundException();
    return theme();
  }

  void savePrefTheme(ThemeData theme) {
    return PreferencesHelper().setValue<String>(
      key: THEME_KEY,
      value: _getThemeName(theme),
    );
  }

  String _getThemeName(ThemeData theme) =>
      getAllThemes().singleWhere((k) => getThemeByName(k) == theme);
}

class ThemeNotFoundException implements Exception {}

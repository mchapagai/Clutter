import 'package:clutter/core/preferences_helper.dart';
import 'package:clutter/ui_kit/cluttter_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
  /// Use [themeKey] to save the app'e theme from settings.
  /// This should be a [String] and must only assume the values  inside ThemeProvider
  final String themeKey = "theme";

  /// usage `_themes["light"]()`
  Map<String, Function> _themes = {
    "dark": _getDarkTheme,
    "light": _getLightTheme,
  };
  static ThemeData _getLightTheme() => ClutterTheme.clutterLightTheme;
  static ThemeData _getDarkTheme() => ClutterTheme.clutterDarkTheme;
  List<String> getAllThemes() => _themes.keys.toList();

  ThemeData getThemeByName(String name) {
    var theme = _themes[name];
    if (theme == null) throw ThemeNotFoundException;
    return theme();
  }

  ThemeData initializeCluttterTheme() => getThemeByName(
        PreferencesHelper().getValue(
          key: themeKey,
          defaultValue: "dark",
        ),
      );

  void savePrefTheme(ThemeData theme) => PreferencesHelper().setValue<String>(
        key: themeKey,
        value: _getThemeName(theme),
      );

  String _getThemeName(ThemeData theme) =>
      getAllThemes().singleWhere((k) => getThemeByName(k) == theme);
}

class ThemeNotFoundException implements Exception {}

import 'package:clutter/features/theme/api/shared_preferences_service.dart';
import 'package:clutter/ui_kit/cluttter_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider {
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

  ThemeData getPrefTheme() => getThemeByName(
        ClutterSharedPreferences().getValue(
          key: ClutterSharedPreferences().themeKey,
          defaultValue: "dark",
        ),
      );

  void savePrefTheme(ThemeData theme) =>
      ClutterSharedPreferences().setValue<String>(
        key: ClutterSharedPreferences().themeKey,
        value: _getThemeName(theme),
      );

  String _getThemeName(ThemeData theme) =>
      getAllThemes().singleWhere((k) => getThemeByName(k) == theme);
}

class ThemeNotFoundException implements Exception {}

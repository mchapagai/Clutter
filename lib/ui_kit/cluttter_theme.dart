import 'package:flutter/material.dart';

/// [TextTheme] https://api.flutter.dev/flutter/material/TextTheme-class.html

class ClutterTheme {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData clutterLightTheme =
      _clutterLightTheme(_lightColorScheme, _lightFocusColor);

  static ThemeData clutterDarkTheme =
      _clutterDarkTheme(_darkColorScheme, _darkFocusColor);
}

ThemeData _clutterDarkTheme(ColorScheme colorScheme, Color focusColor) {
  return ThemeData(
    primaryColor: Color(0xFF030303),
    colorScheme: colorScheme,
    textTheme: _textTheme.apply(
      bodyColor: Color(0xffffffff),
    ),
    appBarTheme: AppBarTheme(
      textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
      color: colorScheme.background,
      elevation: 0,
      iconTheme: IconThemeData(color: colorScheme.primary),
      brightness: colorScheme.brightness,
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
    canvasColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    accentColor: Color(0xffffeb3b),
    accentColorBrightness: Brightness.light,
    highlightColor: Colors.transparent,
    focusColor: focusColor,
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Color.alphaBlend(
        Color(0xffffffff).withOpacity(0.8),
        Color(0xffffffff).withOpacity(0.12),
      ),
      contentTextStyle: _textTheme.subtitle1?.apply(
        color: Color(0xffffffff),
      ),
    ),
  );
}

ColorScheme _darkColorScheme = ColorScheme(
  primary: Color(0xff2196f3),
  primaryVariant: Color(0xff000000),
  secondary: Color(0xff64ffda),
  secondaryVariant: Color(0xff00bfa5),
  surface: Color(0xff424242),
  background: Color(0xff616161),
  error: Color(0xffd32f2f),
  onPrimary: Color(0xffffffff),
  onSecondary: Color(0xff000000),
  onSurface: Color(0xffffffff),
  onBackground: Color(0xffffffff),
  onError: Color(0xff000000),
  brightness: Brightness.dark,
);

ThemeData _clutterLightTheme(ColorScheme colorScheme, Color focusColor) =>
    ThemeData(
      primarySwatch: Colors.blue,
      colorScheme: colorScheme,
      textTheme: _textTheme.apply(
        bodyColor: Color(0xff000000),
      ),
      primaryTextTheme: _textTheme.apply(
        bodyColor: Color(0xffffffff),
      ),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.background),
        color: colorScheme.primary,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.background),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        opacity: 1,
        size: 24,
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      accentColor: colorScheme.primary,
      accentColorBrightness: Brightness.light,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          Color(0xffffffff).withOpacity(0.8),
          Color(0xffffffff).withOpacity(0.12),
        ),
        contentTextStyle: _textTheme.subtitle1?.apply(
          color: Color(0xffffffff),
        ),
      ),
      brightness: Brightness.light,
    );

ColorScheme _lightColorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.blue,
  primaryColorDark: Color(0xff1976d2),
  accentColor: Color(0xff2196f3),
  cardColor: Color(0xffffffff),
  backgroundColor: Color(0xffffffff),
  errorColor: Color(0xffd32f2f),
  brightness: Brightness.light,
);

TextTheme _textTheme = TextTheme(
  headline1: TextStyle(
    fontSize: 96.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Raleway',
    letterSpacing: -1.5,
  ),
  headline2: TextStyle(
    fontSize: 60.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Raleway',
    letterSpacing: -0.5,
  ),
  headline3: TextStyle(
    fontSize: 48.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
  ),
  headline4: TextStyle(
    fontSize: 34.0,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontFamily: 'Raleway',
    letterSpacing: 0.25,
  ),
  headline5: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
  ),
  headline6: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Raleway',
    letterSpacing: 0.15,
  ),
  subtitle1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    letterSpacing: 0.15,
  ),
  subtitle2: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Raleway',
    letterSpacing: 0.1,
  ),
  bodyText1: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    letterSpacing: 0.5,
  ),
  bodyText2: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    letterSpacing: 0.25,
  ),
  button: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'Raleway',
    letterSpacing: 1.25,
  ),
  caption: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    letterSpacing: 0.4,
  ),
  overline: TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    fontFamily: 'Raleway',
    letterSpacing: 1.5,
  ),
);

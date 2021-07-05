import 'package:shared_preferences/shared_preferences.dart';

/// This class is a helper for [SharedPreferences].
class ClutterSharedPreferences {
  /// Use [themeKey] to save the app'e theme from settings.
  /// This should be a [String] and must only assume the values  inside ThemeProvider
  final themeKey = "theme";

  /// Returns the instance of [ClutterSharedPreferences]
  static ClutterSharedPreferences _instance = ClutterSharedPreferences._();

  ClutterSharedPreferences._();

  /// Contains and initializes a singleton of [ClutterSharedPreferences]
  factory ClutterSharedPreferences() => _instance;

  /// instance of [SharedPreferences]
  SharedPreferences? _sharedPreferences;

  /// this MUST be called before any call to any of the function of this class
  /// in order to instantiate [_sharedPreferences].
  Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  /// Sets value of a given [key] to [value].
  /// The function is going to create the field if it does not exist yet
  void setValue<T>({
    required String key,
    required T value,
  }) {
    switch (T) {
      case double:
        _sharedPreferences?.setDouble(key, value as double);
        break;
      case int:
        _sharedPreferences?.setInt(key, value as int);
        break;
      case String:
        _sharedPreferences?.setString(key, value as String);
        break;
      case bool:
        _sharedPreferences?.setBool(key, value as bool);
        break;
      default:
        throw SharedPreferencesException("unknown type : $T");
    }
  }

  /// Get value of type [T] from sharedPreferences.
  ///
  /// If there is no key in the sharedPreferences that matches [key]
  /// and no [defaultValue] is passed it's going to return null.
  T getValue<T>({
    required String key,
    required T defaultValue,
  }) =>
      (_sharedPreferences?.get(key.toString()) ?? defaultValue) as T;

  /// Deletes entry with key [key]
  void removeValue({
    required String key,
  }) =>
      _sharedPreferences?.remove(key.toString());
}

/// Exception thrown by [ClutterSharedPreferences]
class SharedPreferencesException implements Exception {
  final String message;

  SharedPreferencesException(this.message);
}

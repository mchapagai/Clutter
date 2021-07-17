import 'package:shared_preferences/shared_preferences.dart';

/// Wraps the [SharedPreferences]
class PreferencesHelper {
  bool isInitialized = false;

  /// instance of [SharedPreferences]
  SharedPreferences? _preferences;

  /// this MUST be called before any call to any of the function of this class
  /// in order to instantiate [_preferences].
  Future<bool> initPreferences() async {
    if (_preferences != null) return true;
    _preferences = await SharedPreferences.getInstance();
    isInitialized = true;
    return true;
  }

  /// Sets value of a given [key] to [value].
  /// The function is going to create the field if it does not exist yet
  void setValue<T>({
    required String key,
    required T value,
  }) {
    switch (T) {
      case double:
        _preferences?.setDouble(key, value as double);
        break;
      case int:
        _preferences?.setInt(key, value as int);
        break;
      case String:
        _preferences?.setString(key, value as String);
        break;
      case bool:
        _preferences?.setBool(key, value as bool);
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
      (_preferences?.get(key.toString()) ?? defaultValue) as T;

  /// Deletes entry with key [key]
  void removeValue({
    required String key,
  }) =>
      _preferences?.remove(key.toString());
}

/// Exception thrown by [PreferencesHelper]
class SharedPreferencesException implements Exception {
  final String message;

  SharedPreferencesException(this.message);
}

import 'package:clutter/core/bloc_provider.dart';
import 'package:clutter/features/theme/bloc/clutter_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ThemeBloc extends BlocBase {
  PublishSubject<ThemeData> themeController = PublishSubject<ThemeData>();

  Stream<ThemeData> get themeSubscription => themeController.stream;

  static ThemeBloc _instance = ThemeBloc._();

  ThemeBloc._();

  factory ThemeBloc() => _instance;

  /// use this as setTheme(Theme)
  set theme(ThemeData theme) {
    themeController.sink.add(theme);

    ThemeProvider().savePrefTheme(theme);
  }

  @override
  void dispose() {
    themeController.close();
  }
}

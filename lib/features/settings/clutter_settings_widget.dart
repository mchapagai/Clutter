import 'package:clutter/core/bloc_provider.dart';
import 'package:clutter/features/settings/settings_screen.dart';
import 'package:clutter/references/clutter_theme_bloc.dart';
import 'package:clutter/features/theme/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';

class ClutterSettingsWidget extends StatelessWidget {
  // TODO this will be deleted when StreamBuilder is used

  @override
  Widget build(BuildContext context) {
    ThemeBloc bloc = BlocProvider.of<ThemeBloc>(context) ?? ThemeBloc();
    ThemeViewModel viewModel = ThemeViewModel();

    // bloc.themeController;
    // bloc.themeChangeController;

    // bloc.themeController.launch()
    // bloc.themeChangeController.launch()

    // StreamBuilder
    // stream: bloc.themeSubscription.recieve
    return SettingsScreen(
      onTapThemeChange: () => _onTapThemeSwitch(bloc, viewModel),
      themeViewModel: ThemeViewModel(),
    );
  }

  _onTapThemeSwitch(ThemeBloc bloc, ThemeViewModel viewModel) {
    // bloc.updateThemeChangeValue;
  }
}

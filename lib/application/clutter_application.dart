import 'package:clutter/core/bloc_provider.dart';
import 'package:clutter/features/theme/bloc/clutter_theme_provider.dart';
import 'package:clutter/features/theme/bloc/theme_bloc.dart';
import 'package:clutter/navigation/routes.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class ClutterApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// instance of the BLoC used to handle theme change, called when a theme is
    /// changed to rebuild the whole app with the new theme.
    ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context) ?? ThemeBloc();
    themeBloc.themeController;

    // TODO fix [initialData]
    // TODO do not expose methods from bloc into UI
    return StreamBuilder<ThemeData>(
      stream: themeBloc.themeSubscription,
      initialData: ThemeProvider().initializeCluttterTheme(),
      builder: (context, theme) {
        return MaterialApp(
          /// Hide the debug banner
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          initialRoute: Routes.initialRoute,
          routes: Routes.setUpRoutes,
          themeMode: ThemeMode.system,
          theme: theme.data,
        );
      },
    );
  }
}

import 'package:clutter/navigation/routes.dart';
import 'package:clutter/ui_kit/cluttter_theme.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

/// Root class that every UI test classes is going to use

class WidgetTestWrapper extends StatelessWidget {
  final Widget child;

  WidgetTestWrapper(this.child);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      themeMode: ThemeMode.system,
      theme: ClutterTheme.clutterLightTheme,
      builder: (context, child) {
        return Theme(
          data: ClutterTheme.clutterDarkTheme,
          child: child ?? this.child,
        );
      },
      home: child,
    );
  }
}

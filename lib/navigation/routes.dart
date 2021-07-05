import 'package:clutter/application/clutter_application_screen.dart';
import 'package:flutter/material.dart';

/// The [Routes] provides the ability to handle routes from the underlying
/// platform and display the appropriate pages

class Routes {
  /// The default value of optional parameter must be const
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> setUpRoutes = {
    '/': (BuildContext context) => ClutterApplicationScreen(),
  };
}

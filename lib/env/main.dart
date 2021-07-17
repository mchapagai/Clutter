import 'package:clutter/application/clutter_application.dart';
import 'package:clutter/core/preferences_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesHelper().initPreferences();

  // ClearAppSettings().clearDataIfFirstTimeLaunch().whenComplete(
  //       () => runApp(
  //         ClutterApplication(),
  //       ),
  //     );

  runApp(
    ClutterApplication(),
  );
}

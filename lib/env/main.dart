import 'package:clutter/application/clutter_application.dart';
import 'package:clutter/features/theme/api/shared_preferences_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ClutterSharedPreferences().init();
  runApp(
    ClutterApplication(),
  );
}

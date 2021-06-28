import 'package:clutter/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class ClutterSettingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SettingsScreen(),
    );
  }
}

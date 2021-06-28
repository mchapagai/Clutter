import 'package:clutter/application/clutter_application_screen.dart';
import 'package:flutter/material.dart';

class ClutterApplication extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClutterApplicationScreen(),
    );
  }
}

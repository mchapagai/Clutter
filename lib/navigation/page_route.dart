import 'package:flutter/material.dart';

pushWidgetWithFade(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionsBuilder: (context, animation, secondAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return widget;
      },
    ),
  );
}

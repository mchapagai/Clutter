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
      // initialRoute: Routes.initialRoute,
      builder: (context, child) {
        return Theme(
          data: ThemeData(),
          child: child ?? this.child,
        );
      },
      home: child,
    );
  }
}

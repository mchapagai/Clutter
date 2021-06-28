import 'package:clutter/application/application_widget_keys.dart';
import 'package:clutter/application/clutter_application.dart';
import 'package:clutter/application/clutter_application_screen.dart';
import 'package:clutter/features/settings/clutter_settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/widget_test_widget.dart';

GlobalKey<NavigatorState> mockNavigatorKey = GlobalKey<NavigatorState>();
void main() {
  testWidgets(
    'Clutter Application Test',
    (WidgetTester widgetTester) async {
      WidgetTestWrapper widget = WidgetTestWrapper(
        Material(
          child: Navigator(
            key: mockNavigatorKey,
            onGenerateRoute: (routeStrrings) {
              return MaterialPageRoute(
                  builder: (context) => ClutterApplication(),
                  maintainState: false);
            },
          ),
        ),
      );
      await widgetTester.pumpWidget(widget);
      expect(find.byType(ClutterApplicationScreen), findsOneWidget);
      await widgetTester.pumpAndSettle();

      Finder settingsWidget =
          find.byKey(ClutterWidgetKeys().clutterScreenSettingsKey);

      expect(settingsWidget, findsOneWidget);
      await widgetTester.tap(settingsWidget);
      await widgetTester.pumpAndSettle();
      expect(find.byType(ClutterSettingsWidget), findsOneWidget);
    },
  );
}

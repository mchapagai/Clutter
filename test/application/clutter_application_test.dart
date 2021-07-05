import 'package:clutter/application/application_widget_keys.dart';
import 'package:clutter/application/clutter_application.dart';
import 'package:clutter/application/clutter_application_screen.dart';
import 'package:clutter/core/bloc_provider.dart';
import 'package:clutter/features/settings/clutter_settings_widget.dart';
import 'package:clutter/features/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/widget_test_widget.dart';

GlobalKey<NavigatorState> mockNavigatorKey = GlobalKey<NavigatorState>();
void main() async {
  testWidgets(
    'Clutter Application Test',
    (WidgetTester widgetTester) async {
      WidgetTestWrapper widget = WidgetTestWrapper(
        Material(
          child: BlocProvider(
            blocBuilder: () => ThemeBloc(),
            child: Navigator(
              key: mockNavigatorKey,
              onGenerateRoute: (routeStrrings) {
                return MaterialPageRoute(
                    builder: (context) => ClutterApplication(),
                    maintainState: false);
              },
            ),
          ),
        ),
      );
      await widgetTester.pumpWidget(widget);
      await widgetTester.pumpAndSettle();

      expect(find.byType(ClutterApplicationScreen), findsOneWidget);
      Finder settingsWidget =
          find.byKey(ClutterWidgetKeys().clutterScreenSettingsKey);

      expect(settingsWidget, findsOneWidget);
      await widgetTester.tap(settingsWidget);
      await widgetTester.pumpAndSettle();
      expect(find.byType(ClutterSettingsWidget), findsOneWidget);
    },
  );
}

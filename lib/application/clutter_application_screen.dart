import 'package:clutter/application/application_widget_keys.dart';
import 'package:clutter/features/settings/clutter_settings_widget.dart';
import 'package:clutter/utils/clutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClutterApplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildLandingScreen(context);
  }

  _buildLandingScreen(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.loose,
        children: [
          Positioned(
            key: Key('SomeKey'),
            top: 56,
            left: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey2'),
            top: 56,
            left: MediaQuery.of(context).size.width / 2,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: ClutterWidgetKeys().clutterScreenSettingsKey,
            top: 56,
            right: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.transparent,
              icon: settingsIcon,
              height: 60.0,
              width: 60.0,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClutterSettingsWidget(),
                  maintainState: false,
                ),
              ),
            ),
          ),
          Positioned(
            key: Key('SomeKey4'),
            top: 130,
            left: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 240.0,
              width: 240.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey5'),
            top: 130,
            right: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 180.0,
              width: 180.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey6'),
            top: 480,
            right: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 240.0,
              width: 240.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey7'),
            top: 480,
            left: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 160.0,
              width: 160.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey16'),
            bottom: 20,
            right: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'right bottom',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width / 2.3,
            child: _screenPositionedWidget(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center bottom',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: _screenPositionedWidget(
              context,
              0.0,
              400.0,
              Colors.red,
              title: 'Left bottom',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
        ],
      ),
    );
  }

  _screenPositionedWidget(
    BuildContext context,
    double borderWidth,
    double circleRadius,
    Color borderColor, {
    VoidCallback? onTap,
    String? title,
    String? icon,
    double? height,
    double? width,
    Color? backgroundColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: borderWidth,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(circleRadius),
          color: backgroundColor,
          // shape: BoxShape.circle,
        ),
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        child: Center(
          child: title != null
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                )
              : SvgPicture.asset(
                  icon ?? '',
                  color: Theme.of(context).colorScheme.onSurface,
                ),
        ),
      ),
    );
  }
}

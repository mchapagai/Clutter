import 'package:clutter/application/application_widget_keys.dart';
import 'package:clutter/features/settings/clutter_settings_widget.dart';
import 'package:clutter/navigation/page_route.dart';
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
        fit: StackFit.expand,
        children: [
          _screenPositionedWidget(
            context,
            key: ClutterWidgetKeys().clutterScreenSettingsKey,
            top: kToolbarHeight,
            right: 20,
            icon: settingsIcon,
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            onTap: () => pushWidgetWithFade(
              context,
              ClutterSettingsWidget(),
            ),
          ),
          // TODO fix the following
          Positioned(
            key: Key('SomeKey'),
            top: kToolbarHeight,
            left: 20,
            child: _screenPositionedWidgetOld(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'left top',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey2'),
            top: kToolbarHeight,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: _screenPositionedWidgetOld(
              context,
              0.0,
              200.0,
              Colors.red,
              title: 'center top',
              height: 60.0,
              width: 60.0,
              onTap: () => {
                throw UnimplementedError(),
              },
            ),
          ),
          Positioned(
            key: Key('SomeKey4'),
            top: 130,
            left: 20,
            child: _screenPositionedWidgetOld(
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
            child: _screenPositionedWidgetOld(
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
            child: _screenPositionedWidgetOld(
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
            child: _screenPositionedWidgetOld(
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
            child: _screenPositionedWidgetOld(
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
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: _screenPositionedWidgetOld(
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
            child: _screenPositionedWidgetOld(
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

  Positioned _screenPositionedWidget(
    BuildContext context, {
    double? borderWidth,
    double? circleRadius,
    Color? borderColor,
    Key? key,
    double? top,
    double? bottom,
    double? left,
    double? right,
    VoidCallback? onTap,
    String? title,
    String? icon,
    double? height,
    double? width,
    Color? backgroundColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) {
    return Positioned(
      key: key,
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth ?? 0.0,
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(circleRadius ?? 200.0),
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
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  )
                : SvgPicture.asset(
                    icon ?? '',
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
          ),
        ),
      ),
    );
  }

  /// Use _screenPositionedWidget method instead'
  _screenPositionedWidgetOld(
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

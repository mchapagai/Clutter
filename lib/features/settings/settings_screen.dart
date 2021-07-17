import 'package:clutter/features/theme/bloc/clutter_theme_provider.dart';
import 'package:clutter/features/theme/bloc/theme_bloc.dart';
import 'package:clutter/features/theme/view_model/theme_view_model.dart';
import 'package:clutter/ui_kit/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function onTapThemeChange;
  final ThemeViewModel themeViewModel;

  SettingsScreen({
    required this.onTapThemeChange,
    required this.themeViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _settingScreen(context),
    );
  }

  _settingScreen(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildCircularImage(context),
              SizedBox(height: 16.0),
              _buildSettingsTitle(context, 'Theme'),
              _buildChangeThemeTile(context),
              SizedBox(height: 16.0),
              _buildSettingsTitle(context, 'About'),
              SizedBox(height: 16.0),
              _buildSettingsTitle(context, 'Dependencies'),
              SizedBox(height: 16.0),
              _buildSettingsTitle(context, 'About developer'),
              SizedBox(height: 16.0),
              _switch(),
            ],
          ),
        ),
      ],
    );
  }

  _buildCircularImage(BuildContext context) {
    return Container(
      width: 190.0,
      height: 190.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(appLogo),
        ),
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary, width: 4.0),
      ),
    );
  }

  _buildSettingsTitle(BuildContext context, String title) => Container(
        child: Container(
          height: 36.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      );

  ListTile _buildChangeThemeTile(BuildContext context) {
    return ListTile(
      title: Text('Choose Theme'),
      subtitle: Text("Change the whole app's appearance"),
      onTap: () => showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          ThemeProvider themeProvider = ThemeProvider();
          List supportedThemes = themeProvider.getAllThemes();
          return ClutterDialog(
            title: 'Choose Theme',
            child: ListView.builder(
              itemCount: supportedThemes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 12,
                    backgroundColor: themeProvider
                        .getThemeByName(
                          supportedThemes[index],
                        )
                        .accentColor,
                  ),
                  title: Text(_theme(supportedThemes[index])),
                  onTap: () {
                    ThemeBloc().theme = themeProvider.getThemeByName(
                      supportedThemes[index],
                    );
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _theme(String supportedTheme) {
    switch (supportedTheme) {
      case "light":
        return 'Light';
      case "dark":
        return 'Dark';
      default:
        return "unknown";
    }
  }

  _switch() {
    return MergeSemantics(
      child: ListTile(
        title: Text('Lights'),
        trailing: Switch.adaptive(
          value: themeViewModel.isThemeChanged,
          onChanged: (bool value) {
            onTapThemeChange(value);
          },
        ),
      ),
    );
  }
}

class ClutterDialog extends StatelessWidget {
  final String title;
  final Widget child;

  const ClutterDialog({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 4,
      child: Container(
        height: MediaQuery.of(context).size.height / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3 - 50,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

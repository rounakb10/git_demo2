import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    String id = ThemeProvider.controllerOf(context).currentThemeId;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.brightness_4),
            title: Text('Enable Dark Mode'),
            trailing: Switch(
              value: id == 'actual_light' ? false : true,
              onChanged: (value) {
                if (value)
                  ThemeProvider.controllerOf(context).setTheme("actual_dark");
                else
                  ThemeProvider.controllerOf(context).setTheme("actual_light");
              },
            ),
          ),
        ],
      ),
    );
  }
}

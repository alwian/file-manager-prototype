import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'package:prototype/pages/settings_page.dart';

void main() => runApp(
  CupertinoApp(
    title: 'Prototype',
    home: HomePage(),
    theme: CupertinoThemeData(
      primaryColor: Color(0xFF2F539A),
      primaryContrastingColor: CupertinoColors.white,
      textTheme: CupertinoTextThemeData(
        navTitleTextStyle: TextStyle(
          inherit: false,
          color: CupertinoColors.white,
          fontSize: 18.0
        ),
        navActionTextStyle: TextStyle(
          inherit: false,
          color: CupertinoColors.white,
          fontSize: 18.0
        )
      ),
    ),
    routes: {
      'settings' : (context) => SettingsPage()
    }
  )
);




import 'package:flutter/material.dart';
import 'package:git_demo2/Screens/home.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color bgColor = Color(0xff121212);
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
          id: "actual_dark",
          description: "Dark",
          data: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            accentColor: Colors.grey[850],
            appBarTheme: AppBarTheme(
              color: bgColor,
            ),
            cardColor: Colors.transparent,
            bottomAppBarColor: bgColor,
            cardTheme: CardTheme(elevation: 0),
          ),
        ),
        AppTheme(
          id: "actual_light",
          description: "Light",
          data: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white,
            cardColor: Colors.transparent,
            cardTheme: CardTheme(elevation: 0),
          ),
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            home: Home(),
          ),
        ),
      ),
    );
  }
}

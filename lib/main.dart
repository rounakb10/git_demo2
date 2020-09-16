import 'package:flutter/material.dart';
import 'package:git_demo2/Screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff121212),
        accentColor: Colors.grey[850],
        appBarTheme: AppBarTheme(
          color: Color(0xff121212),
        ),
        cardColor: Colors.transparent,
        bottomAppBarColor: Color(0xff121212),
        cardTheme: CardTheme(elevation: 0),
      ),
//      theme: ThemeData.light().copyWith(
//        scaffoldBackgroundColor: Colors.white,
//        cardColor: Colors.transparent,
//        cardTheme: CardTheme(elevation: 0),
//      ),
      home: Home(),
    );
  }
}

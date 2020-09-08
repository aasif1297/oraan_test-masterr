import 'package:flutter/material.dart';
import 'package:oraan_project/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
        primaryColor: Color(0xFF50C4CC),
        accentColor: Color(0xFF2B4655),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 96.0,
              fontWeight: FontWeight.w300,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          headline2: TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.w300,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          headline3: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          headline4: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          headline5: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          headline6: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Noto Sans HK',
              color: Color(0xFF2B4655)),
          subtitle1: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B4655)),
          subtitle2: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w500,
              color: Color(0xFF2B4655)),
          bodyText1: TextStyle(
              fontSize: 16.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B4655)),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B4655)),
          button: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w500,
              color: Color(0xFF2B4655)),
          caption: TextStyle(
              fontSize: 12.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B4655)),
          overline: TextStyle(
              fontSize: 10.0,
              fontFamily: 'Noto Sans HK',
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B4655)),
        ),
        fontFamily: 'achri',
      ),
      home: SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class Themes{
  final lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xffFFFFFF),
    scaffoldBackgroundColor: Color(0xffFFFFFF),
    canvasColor: Color(0xffFFFFFF),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0
    )

  );
  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.light,
    canvasColor: Color(0xff2C2B47),
    primaryColor: Color(0xff2C2B47),
      scaffoldBackgroundColor: Color(0xff2C2B47),
     );
}
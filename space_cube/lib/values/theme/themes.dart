import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      toolbarTextStyle: TextStyle(color: Colors.black),
    ),
    textTheme: TextTheme(headline1: TextStyle(color: Colors.black)),
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      toolbarTextStyle: TextStyle(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(buttonColor: Colors.purple),
  );
}

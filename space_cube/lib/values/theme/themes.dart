import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  ThemeData lightTheme = ThemeData.light();
  // (
  //     brightness: Brightness.light,
  //     visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  //     primarySwatch: MaterialColor(
  //       0xFFF5E0C3,
  //       <int, Color>{
  //         50: Color(0xFFECEFF1),
  //         100: Color(0xFFCFD8DC),
  //         200: Color(0xFFB0BEC5),
  //         300: Color(0xFF90A4AE),
  //         400: Color(0xFF78909C),
  //         500: Color(0xFF607D8B),
  //         600: Color(0xFF546E7A),
  //         700: Color(0xFF455A64),
  //         800: Color(0xFF37474F),
  //         900: Color(0xFF263238),
  //       },
  //     ),
  //     primaryColor: Color(0xFF607D8B),
  //     primaryColorBrightness: Brightness.light,
  //     primaryColorLight: Color(0x1aF5E0C3),
  //     primaryColorDark: Color(0xff936F3E),
  //     canvasColor: Color(0xffE09E45),
  //     accentColor: Color(0xff457BE0),
  //     accentColorBrightness: Brightness.light,
  //     scaffoldBackgroundColor: Color(0xffB5BFD3),
  //     bottomAppBarColor: Color(0xff6D42CE),
  //     cardColor: Color(0xaaF5E0C3),
  //     dividerColor: Color(0x1f6D42CE),
  //     focusColor: Color(0x1aF5E0C3));

  ThemeData darkTheme = ThemeData.dark();
  // (
  //     brightness: Brightness.dark,
  //     visualDensity: VisualDensity(vertical: 0.5, horizontal: 0.5),
  //     primarySwatch: MaterialColor(
  //       0xFFF5E0C3,
  //       <int, Color>{
  //         50: Color(0x1a5D4524),
  //         100: Color(0xa15D4524),
  //         200: Color(0xaa5D4524),
  //         300: Color(0xaf5D4524),
  //         400: Color(0x1a483112),
  //         500: Color(0xa1483112),
  //         600: Color(0xaa483112),
  //         700: Color(0xff483112),
  //         800: Color(0xaf2F1E06),
  //         900: Color(0xff2F1E06),
  //       },
  //     ),
  //     primaryColor: Color(0xff5D4524),
  //     primaryColorBrightness: Brightness.dark,
  //     primaryColorLight: Color(0x1a311F06),
  //     primaryColorDark: Color(0xff936F3E),
  //     canvasColor: Color(0xffE09E45),
  //     accentColor: Color(0xff457BE0),
  //     accentColorBrightness: Brightness.dark,
  //     scaffoldBackgroundColor: Color(0xffB5BFD3),
  //     bottomAppBarColor: Color(0xff6D42CE),
  //     cardColor: Color(0xaa311F06),
  //     dividerColor: Color(0x1f6D42CE),
  //     focusColor: Color(0x1a311F06));

  // final lightTheme = ThemeData.light().copyWith(
  //   primaryColor: Colors.blueGrey,
  //   appBarTheme: AppBarTheme(
  //     systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  //     toolbarTextStyle: TextStyle(color: Colors.black),
  //   ),
  //   textTheme: TextTheme(headline1: TextStyle(color: Colors.black)),
  //   buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
  // );

  // final darkTheme = ThemeData.dark().copyWith(
  //   primaryColor: Colors.blueGrey[800],
  //   appBarTheme: AppBarTheme(
  //     systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
  //     toolbarTextStyle: TextStyle(color: Colors.white),
  //   ),
  //   buttonTheme: ButtonThemeData(buttonColor: Colors.purple),
  // );
}

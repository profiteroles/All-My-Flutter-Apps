import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: veryLightGrey, width: 2, style: BorderStyle.solid),
);

final borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData.light().copyWith(
  primaryColor: purple,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,

  appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(color: lightGrey, size: 34),
      color: white,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        color: darkPrimaryVar,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.3,
      )),

  dialogTheme: const DialogTheme(
    titleTextStyle: TextStyle(color: black, fontSize: 24),
    contentTextStyle: TextStyle(color: grey, fontSize: 16),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: purple),
  primaryColorLight: veryLightGrey,
  bottomAppBarColor: veryLightGrey,
  primaryColorDark: white,
  scaffoldBackgroundColor: white,
  canvasColor: white,
  textTheme: GoogleFonts.ralewayTextTheme().apply().copyWith(
      // headline1: const TextStyle(fontWeight: FontWeight.bold),
      // headline2: const TextStyle(fontWeight: FontWeight.bold),
      // headline3: const TextStyle(fontWeight: FontWeight.bold),
      // headline4: const TextStyle(fontWeight: FontWeight.bold),
      // headline5: const TextStyle(fontWeight: FontWeight.bold),
      // headline6: const TextStyle(),
      // subtitle1: const TextStyle(),
      // subtitle2: const TextStyle(),
      // bodyText1: const TextStyle(),
      // bodyText2: const TextStyle(),
      ),
  cardTheme: const CardTheme(color: white),

  //Dialog Theme
  // dialogTheme: const DialogTheme(
  //   contentTextStyle: TextStyle(fontSize: 17, color: black),
  //   titleTextStyle: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //     color: purple,

  //   ),
  // ),

  //Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    border: borderLight,
    enabledBorder: borderLight,
    focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
    hintStyle: GoogleFonts.raleway(color: grey.withOpacity(.4), fontSize: 14),
  ),
  iconTheme: const IconThemeData(color: purple),
  primaryIconTheme: const IconThemeData(color: purple),
  colorScheme: ThemeData().colorScheme.copyWith(
        primary: purple,
        secondary: green,
        onSecondary: purple,
      ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: lightGrey,
  ),
);

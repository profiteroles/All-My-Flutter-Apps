import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'light_theme.dart';

final darkTheme = ThemeData.dark().copyWith(
  primaryColor: purple,
  primaryColorLight: darkPrimaryVar,

  appBarTheme: AppBarTheme(
      actionsIconTheme: const IconThemeData(color: lightGrey, size: 34),
      color: dark,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        color: green,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.3,
      )),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: darkSecondaryVar),
  // canvasColor: grey,
  scaffoldBackgroundColor: dark,
  bottomAppBarColor: Colors.transparent,
  textTheme: GoogleFonts.ralewayTextTheme().apply(bodyColor: green, displayColor: green),
  elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(primary: darkPrimary)),
  // ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(purple)),
  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),

  cardTheme: const CardTheme(color: grey),
  //Dialog Theme
  // dialogTheme: const DialogTheme(
  //   contentTextStyle: TextStyle(fontSize: 17, color: darkSecondaryVar),
  //   titleTextStyle: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //     color: darkSecondary,
  //   ),
  // ),

  //Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    fillColor: grey,
    filled: true,
    border: borderDark,
    enabledBorder: borderDark,
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: darkSecondary),
    ),
    labelStyle: const TextStyle(color: green),
    hintStyle: GoogleFonts.raleway(color: lightGrey, fontSize: 14),
  ),
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  bottomAppBarTheme: const BottomAppBarTheme(color: darkPrimaryVar),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      // backgroundColor: darkPrimaryVar,
      // selectedItemColor: darkSecondaryVar,
      // unselectedItemColor: Colors.red,
      // selectedIconTheme: IconThemeData(
      //   color: Colors.red,
      // ),
      ),
  iconTheme: const IconThemeData(color: white),

  colorScheme: ThemeData().colorScheme.copyWith(
        primary: green,
        secondary: purple,
        onSecondary: white,
        primaryVariant: darkPrimaryVar,
        secondaryVariant: darkSecondaryVar,
      ),
);

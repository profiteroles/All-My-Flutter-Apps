import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const purple = Color(0xFF5117AC);
const green = Color(0xFF20D0C4);
const dark = Color(0xFF03091E);
const grey = Color(0xFF212738);
const lightGrey = Color(0xFFBBBBBB);
const veryLightGrey = Color(0xFFF3F3F3);
const white = Color(0xFFFFFFFF);
const pink = Color(0xFFF5638B);

final appGradients = [
  green,
  purple,
];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: veryLightGrey, width: 2, style: BorderStyle.solid),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: white,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        color: purple,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    ),
    bottomAppBarColor: veryLightGrey,
    primaryColorDark: white,
    scaffoldBackgroundColor: white,
    canvasColor: white,
    textTheme: GoogleFonts.ralewayTextTheme().apply(bodyColor: purple, displayColor: purple),
    cardTheme: const CardTheme(color: white),
    // textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //   overlayColor: MaterialStateProperty.all(Colors.transparent),
    // )),
    inputDecorationTheme: InputDecorationTheme(
      border: _borderLight,
      enabledBorder: _borderLight,
      focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      hintStyle: GoogleFonts.raleway(color: grey.withOpacity(.4), fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: purple),
    primaryIconTheme: const IconThemeData(color: purple),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: purple,
          secondary: green,
          onSecondary: purple,
        ));

final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      color: purple,
      titleTextStyle: GoogleFonts.raleway().copyWith(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    ),
    canvasColor: grey,
    scaffoldBackgroundColor: dark,
    bottomAppBarColor: Colors.transparent,
    textTheme: GoogleFonts.ralewayTextTheme().apply(bodyColor: green, displayColor: green),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(purple)),
    ),
    cardTheme: const CardTheme(color: grey),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: grey,
      filled: true,
      border: _borderDark,
      contentPadding: EdgeInsets.zero,
      enabledBorder: _borderDark,
      focusedBorder: _borderDark,
      labelStyle: const TextStyle(color: white),
      hintStyle: GoogleFonts.raleway(color: lightGrey, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: white),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: green,
          secondary: purple,
          onSecondary: white,
        ));

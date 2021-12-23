import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'light_theme.dart';

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
      border: borderDark,
      contentPadding: EdgeInsets.zero,
      enabledBorder: borderDark,
      focusedBorder: borderDark,
      labelStyle: const TextStyle(color: white),
      hintStyle: GoogleFonts.raleway(color: lightGrey, fontSize: 14),
    ),
    iconTheme: const IconThemeData(color: white),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: green,
          secondary: purple,
          onSecondary: white,
        ));

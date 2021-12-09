import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final appGradients = [
  AppColors.green,
  AppColors.purple,
];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: AppColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);
final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: AppColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final lightTheme = ThemeData.light().copyWith(
    canvasColor: AppColors.white,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.purple,
      displayColor: AppColors.purple,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: _borderLight,
      enabledBorder: _borderLight,
      focusedBorder: _borderLight,
      hintStyle: GoogleFonts.poppins(
        color: AppColors.grey,
        fontSize: 14,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.purple),
    primaryIconTheme: IconThemeData(color: AppColors.purple),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.purple,
          secondary: AppColors.green,
        ));

final darkTheme = ThemeData.dark().copyWith(
    canvasColor: AppColors.grey,
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: AppColors.green,
      displayColor: AppColors.green,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.grey,
      filled: true,
      border: _borderDark,
      contentPadding: EdgeInsets.zero,
      enabledBorder: _borderDark,
      focusedBorder: _borderDark,
      labelStyle: TextStyle(color: AppColors.white),
      hintStyle: GoogleFonts.poppins(
        color: AppColors.lightGrey,
        fontSize: 14,
      ),
    ),
    iconTheme: IconThemeData(color: AppColors.white),
    // primaryIconTheme: IconThemeData(color: AppColors.purple),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.green,
          secondary: AppColors.purple,
        ));

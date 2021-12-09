import 'package:deliverone/presentation/login/login.dart';
import 'package:deliverone/presentation/splash/splash.dart';
import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';

class MainThemeStateManagement extends StatelessWidget {
  const MainThemeStateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: LoginScreen(),
    );
  }
}

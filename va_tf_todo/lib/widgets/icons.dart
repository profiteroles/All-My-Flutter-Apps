import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/theme/colors.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(AppIcons.person, fontFamily: 'MaterialIcons'), color: lightPurple),
    Icon(IconData(AppIcons.work, fontFamily: 'MaterialIcons'), color: lightPink),
    Icon(IconData(AppIcons.shop, fontFamily: 'MaterialIcons'), color: lightGreen),
    Icon(IconData(AppIcons.gym, fontFamily: 'MaterialIcons'), color: yellow),
    Icon(IconData(AppIcons.trip, fontFamily: 'MaterialIcons'), color: deepPink),
  ];
}

List<Color> getPriorities() {
  return const [
    lightGrey, blue, yellow, red
    // Icon(Icons.outlined_flag, color: lightGrey),
    // Icon(Icons.flag, color: blue),
    // Icon(Icons.flag, color: yellow),
    // Icon(Icons.flag, color: red),
  ];
}

class AppIcons {
  static const person = 0xe491;
  static const work = 0xe11c;
  static const gym = 57810;
  static const trip = 0xe071;
  static const shop = 0xe59c;
}

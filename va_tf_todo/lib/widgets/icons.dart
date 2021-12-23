import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import '../values/utils/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(IconData(personIcon, fontFamily: 'MaterialIcons'), color: lightPurple),
    Icon(IconData(workIcon, fontFamily: 'MaterialIcons'), color: lightPink),
    Icon(IconData(movieIcon, fontFamily: 'MaterialIcons'), color: lightGreen),
    Icon(IconData(sportIcon, fontFamily: 'MaterialIcons'), color: yellow),
    Icon(IconData(travelIcon, fontFamily: 'MaterialIcons'), color: deepPink),
    Icon(IconData(shopIcon, fontFamily: 'MaterialIcons'), color: yellow),
  ];
}

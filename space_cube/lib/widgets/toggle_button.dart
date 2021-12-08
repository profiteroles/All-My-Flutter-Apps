import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DarkThemeToggle extends StatelessWidget {
  const DarkThemeToggle({
    Key? key,
    required this.onToggle,
    required this.value,
  }) : super(key: key);

  final bool value;
  final void Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 90.0,
      height: 45.0,
      toggleSize: 30.0,
      value: value,
      borderRadius: 30.0,
      padding: 2.0,
      activeToggleColor: Color(0xFF6E40C9),
      inactiveToggleColor: Color(0xFF2F363D),
      activeSwitchBorder: Border.all(color: Color(0xFF3C1E70), width: 6.0),
      inactiveSwitchBorder: Border.all(color: Color(0xFFD1D5DA), width: 6.0),
      activeColor: Color(0xFF271052),
      inactiveColor: Colors.white,
      activeIcon: Icon(Icons.nightlight_round, color: Color(0xFFF8E3A1)),
      inactiveIcon: Icon(Icons.light_mode, color: Color(0xFFFFDF5D)),
      onToggle: onToggle,
    );
  }
}

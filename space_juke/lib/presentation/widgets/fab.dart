import 'package:flutter/material.dart';

class JukeFab extends StatelessWidget {
  const JukeFab({
    required this.icon,
    required this.onPressed,
    this.label = '',
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      isExtended: true,
      elevation: 10,
      enableFeedback: true,
      onPressed: onPressed,
      label: Text('$label'),
      icon: Icon(icon),
    );
  }
}

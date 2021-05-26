import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({ this.colour, this.onPress, this.cardChild});
  final Color colour; // immutable
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
      ),
    );
  }
}

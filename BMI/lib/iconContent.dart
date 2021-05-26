import 'package:flutter/material.dart';
import './constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.genderIcon, this.label});

  final IconData genderIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

//132***
class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {}
}

class PinkBtn extends StatelessWidget {
  PinkBtn({this.onTap, this.title});
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return;
  }
}

// @dart=2.9

import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';
import 'showup.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RightDetails extends StatefulWidget {
  const RightDetails({Key key}) : super(key: key);

  @override
  State<RightDetails> createState() => _RightDetailsState();
}

class _RightDetailsState extends State<RightDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ShowUp(
            child: Expanded(child: Dice()),
            delay: 11000,
          ),
          ShowUp(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
              child: Text(
                "ROLL THE DICE",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            ),
            delay: 11000,
          ),
        ],
      ),
    );
  }
}

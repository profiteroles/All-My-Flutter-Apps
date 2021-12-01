// @dart=2.9

import 'package:flutter/material.dart';
import 'showup.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LeftDetails extends StatefulWidget {
  const LeftDetails({Key key}) : super(key: key);

  @override
  State<LeftDetails> createState() => _LeftDetailsState();
}

class _LeftDetailsState extends State<LeftDetails> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PageTitle(),
          SizedBox(height: 30),
          ShowUp(
            child: Text(
              'An Emerging Web Technology',
              style: TextStyle(fontSize: 21, height: 1.7),
              textAlign: TextAlign.center,
            ),
            delay: 6000,
          ),
          SizedBox(height: 30),
          ShowUp(
            child: HiddenThanks(),
            delay: 9000,
          ),
          SizedBox(height: 30),
          ShowUp(
            child: Text(
              'Author: Silvena Lam',
              style: TextStyle(fontSize: 21, height: 1.7),
              textAlign: TextAlign.center,
            ),
            delay: 7000,
          ),
          ShowUp(
            child: Text(
              'Student ID: 20070610',
              style: TextStyle(fontSize: 21, height: 1.7),
              textAlign: TextAlign.center,
            ),
            delay: 8000,
          ),
        ],
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  const PageTitle({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600.0,
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 80, height: 0.9),
        child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
          TyperAnimatedText('APPLYING\nFLUTTER', speed: Duration(milliseconds: 200)),
        ]), //AnimatedTextKit
      ), //DefaultTextStyle
    ); //SizedBox
  }
}

class HiddenThanks extends StatelessWidget {
  const HiddenThanks({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<double>(
      tween: Tween(begin: 0.0, end: 1),
      duration: const Duration(seconds: 10),
      curve: Curves.easeOut,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: Text(
        "Special Thanks to North Metro TAFE",
        style: TextStyle(color: Colors.black, fontSize: 6),
        textAlign: TextAlign.left,
        textScaleFactor: 5,
      ),
    );
  }
}

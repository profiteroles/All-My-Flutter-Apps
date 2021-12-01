// @dart=2.9

import 'package:flutter/material.dart';
import 'animations.dart';

class ColourChangingBackground extends StatefulWidget {
  @override
  State<ColourChangingBackground> createState() => _ColourChangingBackgroundState();
}

class _ColourChangingBackgroundState extends State<ColourChangingBackground> {
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("color1").add(const Duration(seconds: 3), ColorTween(begin: const Color.fromARGB(255, 138, 17, 58), end: const Color.fromARGB(255, 1, 87, 155))),
      Track("color2").add(const Duration(seconds: 3), ColorTween(begin: const Color.fromARGB(255, 68, 2, 22), end: const Color.fromARGB(255, 30, 136, 229)))
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: tween,
      duration: tween.duration,
      builder: (context, animation) {
        return Container(
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [animation["color1"], animation["color2"]])),
        );
      },
    );
  }
}

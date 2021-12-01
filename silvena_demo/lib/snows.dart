// @dart=2.9
//This script is based on particle_background by  Felix Blaschke
import 'dart:math';
import 'package:flutter/material.dart';
import 'animations.dart';
import 'package:simple_animations/simple_animations.dart';

class Snows extends StatefulWidget {
  final int numberOfSnows;

  Snows(this.numberOfSnows);

  @override
  _SnowsState createState() => _SnowsState();
}

class _SnowsState extends State<Snows> {
  final Random random = Random();

  final List<SnowModel> snows = [];

  @override
  void initState() {
    List.generate(widget.numberOfSnows, (index) {
      snows.add(SnowModel(random));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Rendering(
      startTime: Duration(seconds: 60),
      onTick: _simulateSnows,
      builder: (context, time) {
        return CustomPaint(
          painter: SnowPainter(snows, time),
        );
      },
    );
  }

  _simulateSnows(Duration time) {
    snows.forEach((snow) => snow.maintainRestart(time));
  }
}

class SnowModel {
  Animatable tween;
  double size;
  AnimationProgress animationProgress;
  Random random;

  SnowModel(this.random) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    final startPosition = Offset(-0.2 + 1.4 * random.nextDouble(), -0.2);
    final endPosition = Offset(-0.2 + 1.4 * random.nextDouble(), 1.2);
    final duration = Duration(milliseconds: 3000 + random.nextInt(6000));

    tween = MultiTrackTween([
      Track("x").add(duration, Tween(begin: startPosition.dx, end: endPosition.dx), curve: Curves.easeInOutSine),
      Track("y").add(duration, Tween(begin: startPosition.dy, end: endPosition.dy), curve: Curves.easeIn),
    ]);
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.2;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class SnowPainter extends CustomPainter {
  List<SnowModel> snows;
  Duration time;

  SnowPainter(this.snows, this.time);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withAlpha(30);

    snows.forEach((snow) {
      var progress = snow.animationProgress.progress(time);
      final animation = snow.tween.transform(progress);
      final position = Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.02 * snow.size, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

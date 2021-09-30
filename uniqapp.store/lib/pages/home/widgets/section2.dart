import 'package:flutter/material.dart';
import '../../../models/card.dart';
import '../../../pages/home/widgets/shown_listener.dart';

import '../../../main.dart';

class Section2 extends StatefulWidget {
  @override
  _Section2State createState() => _Section2State();
}

class _Section2State extends State<Section2> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() => setState(() {}));
    _animation = CurvedAnimation(
      curve: Curves.easeOutCubic,
      parent: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, (1 - _animation.value) * height * 0.25),
        child: child,
      ),
      child: WhenShownListener(
        onWidgetShown: () => _animationController.forward(),
        child: Container(
          alignment: Alignment.center,
          height: 400,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(myCards.length, (i) => CustomCard(i: i)),
            ),
          ),
        ),
      ),
    );
  }
}

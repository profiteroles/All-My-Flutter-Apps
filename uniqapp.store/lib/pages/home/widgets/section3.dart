import 'package:flutter/material.dart';
import '../../../models/services.dart';
import '../../../pages/home/widgets/service_card.dart';
import '../../../pages/home/widgets/shown_listener.dart';

class Section3 extends StatefulWidget {
  @override
  _Section3State createState() => _Section3State();
}

class _Section3State extends State<Section3> with SingleTickerProviderStateMixin {
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
    double width = MediaQuery.of(context).size.width;

    if (width > 1000)
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, (1 - _animation.value) * height * 0.25),
          child: child,
        ),
        child: WhenShownListener(
          onWidgetShown: () => _animationController.forward(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              services.length,
              (i) => ServiceCard(index: i),
            ),
          ),
        ),
      );
    else
      return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, (1 - _animation.value) * height * 0.25),
          child: child,
        ),
        child: WhenShownListener(
          onWidgetShown: () => _animationController.forward(),
          child: Container(
            height: 1500,
            child: Column(
              children: List.generate(
                services.length,
                (i) => ServiceCard(index: i),
              ),
            ),
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';

class WhenShownListener extends StatefulWidget {
  final VoidCallback onWidgetShown;
  final Widget child;
  final double initOffset;
  // final AnimationController controller;

  const WhenShownListener({
    Key key,
    @required this.onWidgetShown,
    @required this.child,
    this.initOffset = 0,
  }) : super(key: key);

  @override
  _WhenShownListenerState createState() => _WhenShownListenerState();
}

class _WhenShownListenerState extends State<WhenShownListener> {
  bool hasEmitted = false;

  @override
  Widget build(BuildContext context) {
    final renderObject = context.findRenderObject() as RenderBox;
    final offsetY = renderObject?.localToGlobal(Offset.zero)?.dy ?? 0;
    final deviceHeight = MediaQuery.of(context).size.height;
    if (renderObject != null && offsetY < deviceHeight - widget.initOffset && !hasEmitted) {
      hasEmitted = true;
      widget.onWidgetShown();
    }
    return widget.child;
  }
}

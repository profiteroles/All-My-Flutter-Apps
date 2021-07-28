import 'package:flutter/material.dart';
import '../../../pages/home/widgets/section1.dart';

class MiddleContainer extends StatelessWidget {
  const MiddleContainer({
    Key key,
    this.begin,
    this.end,
    this.child,
  }) : super(key: key);

  final AlignmentGeometry begin, end;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: child ?? Section1(),
      decoration: BoxDecoration(
          gradient: LinearGradient(begin: begin ?? AlignmentDirectional.topCenter, end: end ?? AlignmentDirectional.bottomCenter, colors: [
        Color.fromRGBO(210, 150, 84, 0.1),
        Colors.orange.shade400.withOpacity(0.3),
        Colors.orange.withOpacity(0.4),
        Colors.orange.withOpacity(0.5),
        Colors.orange.withOpacity(0.8),
        Colors.orange,
      ])),
    );
  }
}

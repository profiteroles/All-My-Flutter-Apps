import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../pages/home/widgets/shown_listener.dart';

class Section1 extends StatefulWidget {
  @override
  _Section1State createState() => _Section1State();
}

class _Section1State extends State<Section1> with SingleTickerProviderStateMixin {
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
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, (1 - _animation.value) * height * 0.25),
          child: child,
        ),
        child: Column(
          children: <Widget>[
            WhenShownListener(
              // controller: _animationController,
              onWidgetShown: () => _animationController.forward(),
              child: Text('WHAT WE DO', style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 45, color: Colors.black)),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'uniQ',
                    style: Theme.of(context).textTheme.headline6,
                    children: [
                      TextSpan(text: ' App ', style: TextStyle(color: Colors.black, fontSize: 30)),
                      TextSpan(text: 'Store'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            if (width > 500)
              Row(
                children: <Widget>[
                  Expanded(child: Text(kWhatWeDoInfo1, style: Theme.of(context).textTheme.bodyText1)),
                  SizedBox(width: 60),
                  Expanded(
                      child: Text(
                    kWhatWeDoInfo2,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                ],
              )
            else ...[
              Text(kWhatWeDoInfo1),
              SizedBox(height: 30),
              Text(kWhatWeDoInfo2),
            ],
            SizedBox(height: height * 0.1),
          ],
        ),
      ),
    );
  }
}

// class InfoPageAnimation extends StatefulWidget {
//   final Widget child;
//   final ScrollController scrollController;

//   const InfoPageAnimation({Key key, required this.scrollController, required this.child}) : super(key: key);

//   @override
//   _InfoPageAnimationState createState() => _InfoPageAnimationState();
// }

// class _InfoPageAnimationState extends State<InfoPageAnimation> with SingleTickerProviderStateMixin {
//   AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: widget.scrollController,
//       builder: (context, child) {
//         final renderObject = context.findRenderObject() as RenderBox;
//         final offsetY = renderObject.localToGlobal(Offset.zero).dy;
//         final deviceHeight = MediaQuery.of(context).size.height;
//         if (offsetY < deviceHeight && _animationController.isDismissed) {
//           _animationController.forward();
//         }
//         //TODO: Make it work baby
//         else if (offsetY > 0 && _animationController.isCompleted) {
//           _animationController.reverse();
//         }
//         return child;
//       },
//       child: AnimatedBuilder(
//         animation: _animationController,
//         child: widget.child,
//         builder: (context, child) => Transform.translate(
//           offset: Offset(0, 100 * (1 - _animationController.value)),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

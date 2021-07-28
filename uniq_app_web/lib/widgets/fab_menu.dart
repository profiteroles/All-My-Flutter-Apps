import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as math;

class CircularFabMenuController extends AnimationController {
  CircularFabMenuController({
    @required TickerProvider vsync,
  }) : super(vsync: vsync, duration: Duration(milliseconds: 250)) {
    translationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(this);

    rotationAnimation = Tween(begin: 360.0, end: 0.0).animate(
      CurvedAnimation(parent: this, curve: Curves.easeOut),
    );
  }

  Animation translationAnimation;
  Animation rotationAnimation;
}

class CircularFabMenu extends StatefulWidget {
  const CircularFabMenu({
    Key key,
    this.controller,
    @required this.pageController,
  }) : super(key: key);

  final CircularFabMenuController controller;
  final PageController pageController;

  @override
  _CircularFabMenuState createState() => _CircularFabMenuState();
}

class _CircularFabMenuState extends State<CircularFabMenu> with SingleTickerProviderStateMixin {
  CircularFabMenuController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? CircularFabMenuController(vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final paddingBottom = MediaQuery.of(context).padding.bottom * 0.5;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Transform.translate(
          offset: Offset(0, 65),
          child: Container(
            width: _controller.isCompleted ? 220 + paddingBottom : 50,
            height: _controller.isCompleted ? 220 + paddingBottom : 50,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.deferToChild,
          onTap: () => _controller.reverse(),
          onVerticalDragEnd: (_) => _controller.reverse(),
          child: Container(
            padding: EdgeInsets.only(bottom: 20 + paddingBottom),
            width: screenSize.width,
            height: screenSize.height,
            decoration: _controller.isCompleted
                ? BoxDecoration(
                    color: Colors.black.withOpacity(0.01),
                  )
                : null,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircularFabMenuItem(
                  controller: _controller,
                  direction: 200,
                  icon: Icon(Icons.redeem, color: Colors.white),
                  onPressed: () {
                    // HapticFeedback.lightImpact();
                  },
                ),
                CircularFabMenuItem(
                  controller: _controller,
                  direction: 235,
                  icon: Icon(Icons.qr_code, color: Colors.white),
                  onPressed: () {
                    // HapticFeedback.lightImpact();
                    // Modular.to.pushNamed('/qr_scanner', arguments: QrScannerPageArguments(isWallet: false));
                  },
                ),
                CircularFabMenuItem(
                  controller: _controller,
                  direction: 270,
                  icon: Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: () async {
                    // await AddPostPage.show();
                    if (widget.pageController.page != 3) {
                      widget.pageController.jumpToPage(3);
                    }
                  },
                ),
                CircularFabMenuItem(
                  controller: _controller,
                  direction: 305,
                  icon: Icon(Icons.store, color: Colors.white),
                  onPressed: () async {
                    // HapticFeedback.lightImpact();
                    // await TutorialPage.show(TutorialVideo.StoreLocator);
                    // Modular.to.pushNamed(StoreOverviewPage.routeName);
                  },
                ),
                CircularFabMenuItem(
                  icon: Icon(Icons.person),
                  controller: _controller,
                  direction: 340,
                  iconImage: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(image: AssetImage('assets/images/augmented_reality_icon.png')),
                  ),
                  onPressed: () async {
                    // HapticFeedback.lightImpact();
                    // await TutorialPage.show(TutorialVideo.ArVideo);
                    // Modular.to.pushNamed(ArPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CircularFabMenuItem extends StatelessWidget {
  CircularFabMenuItem({
    @required this.controller,
    @required this.direction,
    @required this.icon,
    this.iconImage,
    @required this.onPressed,
  });

  final CircularFabMenuController controller;
  final double direction;
  final Icon icon;
  final Widget iconImage;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset.fromDirection(math.radians(direction), controller.translationAnimation.value * 110),
      child: Transform(
        transform: Matrix4.rotationZ(math.radians(controller.rotationAnimation?.value))..scale(controller.translationAnimation?.value),
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          width: 50,
          height: 50,
          child: this.icon != null
              ? IconButton(
                  icon: icon,
                  enableFeedback: true,
                  onPressed: () {
                    onPressed();
                    controller.reverse();
                  },
                )
              : GestureDetector(
                  child: this.iconImage,
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    onPressed();
                    controller.reverse();
                  },
                ),
        ),
      ),
    );
  }
}

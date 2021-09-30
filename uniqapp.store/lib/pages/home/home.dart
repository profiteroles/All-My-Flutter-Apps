import 'package:animated_background/animated_background.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uniq_app_web/constants.dart';
import 'package:uniq_app_web/pages/about/about.dart';
import 'package:uniq_app_web/pages/blog/blog.dart';
import 'package:uniq_app_web/pages/contact/contact.dart';
import 'package:uniq_app_web/pages/home/widgets/section2.dart';
import 'package:uniq_app_web/pages/home/widgets/middle_sec.dart';
import 'package:uniq_app_web/pages/services/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/section3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  final GlobalKey<FabCircularMenuState> _fabKey = GlobalKey();

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // String encodeQueryParameters(Map<String, String> params) {
  //   return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  // }

  _launch(String url) async {
    try {
      if (await canLaunch('https://$url')) {
        await launch('https://$url');
      } else {
        throw 'Could not launch $url';
      }
    } catch (err) {
      print('Launch URL Error: $err');
    }
  }

  final Uri mailTo = Uri(scheme: 'mailto', path: 'my@uniqapp.store', query: 'Hi uniQ Developers,\n\n');

  double get offset => _scrollController.hasClients ? _scrollController.offset : 0.0;

  static final texts = ['Services', 'Blog', 'About', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FabCircularMenu(
        key: _fabKey,
        alignment: Alignment.topRight,
        fabElevation: 18,
        animationDuration: Duration(milliseconds: 500),
        animationCurve: Curves.easeInOutExpo,
        ringColor: Colors.orange.withOpacity(0.7),
        ringDiameter: 400,
        fabColor: Colors.orange.withOpacity(.8),
        fabOpenColor: Colors.black,
        fabIconBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        children: [
          OnHoverButton(name: 'Services', page: ServicesPage()),
          OnHoverButton(name: 'Blog', page: BlogPage()),
          OnHoverButton(name: 'About', page: AboutPage()),
          OnHoverButton(name: 'Contact', page: ContactPage()),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          if (_fabKey.currentState.isOpen) _fabKey.currentState.close();
        },
        child: Stack(
          children: [
            Positioned(
              top: -0.3 * offset,
              left: 0,
              right: 0,
              height: screenHeight,
              child: RepaintBoundary(
                child: Image.asset('images/sky/0.jpg', fit: BoxFit.cover),
              ),
            ),
            AnimatedBackground(behaviour: BubblesBehaviour(), vsync: this, child: Container()),
            Scrollbar(
              child: ListView(
                controller: _scrollController,
                cacheExtent: screenHeight * 1,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 120, vertical: 150),
                    height: screenHeight,
                    child: Text('We Can Predict The Future With uniQ Apps', style: Theme.of(context).textTheme.headline2),
                  ),
                  MiddleContainer(),
                  MiddleContainer(
                    begin: AlignmentDirectional.bottomCenter,
                    end: AlignmentDirectional.topCenter,
                    child: Section2(),
                  ),
                  Container(color: Colors.white, child: Section3()),
                  Container(
                    color: Colors.white,
                    child: Expanded(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          boxShadow: [
                            BoxShadow(color: Colors.orange),
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 3),
                              blurRadius: 10,
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(kFooter, style: Theme.of(context).textTheme.subtitle1),
                                if (width > 800)
                                  TextButton(
                                    child: Text(kFooterEmail, style: Theme.of(context).textTheme.subtitle1),
                                    onPressed: () => launch(mailTo.toString()),
                                  ),
                              ],
                            ),
                            if (width < 800)
                              TextButton(
                                child: Text(kFooterEmail, style: Theme.of(context).textTheme.subtitle1),
                                onPressed: () => launch(mailTo.toString()),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  focusColor: Colors.orange,
                                  color: Colors.white,
                                  highlightColor: Colors.orange,
                                  hoverColor: Colors.orange,
                                  onPressed: () => _launch(kFB),
                                  icon: FaIcon(FontAwesomeIcons.facebookF),
                                ),
                                IconButton(onPressed: () => _launch(kTW), icon: FaIcon(FontAwesomeIcons.twitter)),
                                IconButton(onPressed: () => _launch(kGIT), icon: FaIcon(FontAwesomeIcons.github)),
                                IconButton(onPressed: () => _launch(kINT), icon: FaIcon(FontAwesomeIcons.instagram)),
                                IconButton(onPressed: () => _launch(kIN), icon: FaIcon(FontAwesomeIcons.linkedinIn)),
                              ],
                            ),
                            Text(kCopyRight),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  maxRadius: 70,
                  backgroundImage: AssetImage('images/logo2w.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnHoverButton extends StatefulWidget {
  // final Widget Function(bool isHovered) builder;
  // final Widget child;
  final String name;
  final Widget page;
  const OnHoverButton({
    Key key,
    @required this.name,
    @required this.page,
  }) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  void onEntered(bool isHovered) => setState(() => this.isHovered = isHovered);

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(10, -8, 0); //..scale(1);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) => onEntered(true),
      onExit: (e) => onEntered(false),
      child: AnimatedContainer(
        curve: Curves.decelerate,
        transform: transform,
        duration: Duration(milliseconds: 200),
        child: TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.page)),
          child: Text(
            widget.name,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: isHovered ? Colors.black : Colors.white,
                  decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
                  // decorationColor: Colors.white,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
          ),
          // style: OutlinedButton.styleFrom(
          //   shape: StadiumBorder(), padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
          // side: BorderSide(color: Colors.blue, width: 2),
          // ),
        ),
      ),
    );
  }
}

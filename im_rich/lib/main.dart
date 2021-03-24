import 'package:flutter/material.dart';
import 'package:im_rich/screens/tabs.dart';
// import 'routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeTabs(),
      // routes: Routes.routes(),
      // initialRoute: Routes.initScreen(),
    );
  }
}

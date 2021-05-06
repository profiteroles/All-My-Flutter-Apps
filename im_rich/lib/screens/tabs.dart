import 'package:flutter/material.dart';
import 'package:im_rich/screens/home.dart';
import 'package:im_rich/screens/origin.dart';

class HomeTabs extends StatelessWidget {
  static const String id = 'tabs';
  final _kTabPages = <Widget>[
    OriginalScreen(),
    Home(),
  ];

  final _kTabs = <Tab>[
    Tab(icon: Icon(Icons.phone_android_sharp, size: 20), text: 'Actual\n  App'),
    // Tab(icon: Icon(Icons.book_outlined, size: 20), text: 'Story'),
    Tab(
        icon: Icon(Icons.phone_android, size: 20),
        text: 'ProFitErol\n  Version'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('I am Rich'),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          bottom: TabBar(tabs: _kTabs),
        ),
        body: TabBarView(children: _kTabPages),
      ),
    );
  }
}

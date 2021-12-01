// @dart=2.9

import 'package:flutter/material.dart';
import 'snows.dart';
import 'showup.dart';
import 'left_details.dart';
import 'right_details.dart';
import 'background.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: ColourChangingBackground()),
        Positioned.fill(
            child: ShowUp(
          child: Snows(150),
          delay: 16000,
        )),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(children: [
                      LeftDetails(),
                      Expanded(
                        child: Center(
                          child: RightDetails(),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

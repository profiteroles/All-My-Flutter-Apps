import 'package:flutter/material.dart';
import 'contants.dart';

List<String> values = [];

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => App();
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void search(String value) {
    if (values.contains(value)) {
      setState(() {
        kFoundValue = "Item has found $value";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final String node;
  final Color color;
  CircleWidget({this.node, this.color});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        node.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

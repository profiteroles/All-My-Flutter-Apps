import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        backgroundColor: Colors.pinkAccent,
      ),
      home: Home(),
    );
  }
}

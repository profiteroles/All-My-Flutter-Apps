import 'package:flutter/material.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({Key? key}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genres Page'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:im_rich/screens/story.dart';

class OriginalScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: GestureDetector(
        child: Image.asset('images/diamond.png'),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => StoryScreen(),
          );
        },
      ),
    );
  }
}

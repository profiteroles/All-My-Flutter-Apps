import 'package:flutter/material.dart';
import 'package:im_rich/const.dart';

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff2c3940),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 15),
              Text(
                'I am Rich App',
                style: TextStyle(
                  fontFamily: 'Androgyne',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                kStory,
                style: TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

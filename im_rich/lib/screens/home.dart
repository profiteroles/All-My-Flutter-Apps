import 'end.dart';
import '../widgets/rich_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String id = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Who You Wish To Be Today?'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              title: 'I am Rich',
              color: Colors.yellow[700],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndScreen(
                      noSpace: false,
                      opacity: false,
                      backgroundColor: Colors.blueGrey,
                      title: 'I am Rich',
                      text: 'Your Richness Officially Recognised by Us',
                      image: 'images/goldbag.png',
                      backImage: 'images/coins.png',
                      titleColor: Colors.yellow,
                    ),
                  ),
                );
              },
            ),
            ButtonWidget(
              title: 'I am Free',
              color: Color(0xff4B8B3B).withOpacity(0.9),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndScreen(
                      noSpace: false,
                      opacity: true,
                      backgroundColor: Colors.green[700].withOpacity(1),
                      title: 'I am Free',
                      textColor: Colors.white60,
                      text:
                          'You\'re an Absolute Free Spirit Keep Spreading Your Wisdom With The Whole World',
                      image: 'images/wings.png',
                      backImage: 'images/free.jpg',
                      titleColor: Colors.green[200],
                    ),
                  ),
                );
              },
            ),
            ButtonWidget(
              title: 'I am Poor',
              color: Colors.grey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndScreen(
                      noSpace: true,
                      opacity: false,
                      backgroundColor: Colors.blueGrey,
                      title: 'I am Poor',
                      textColor: Colors.white,
                      text:
                          'That\'s Alright!\n We All Know That Your Pockets Sucked by Taxation Office...',
                      backImage: 'images/poor.png',
                    ),
                  ),
                );
              },
            ),
            ButtonWidget(
              title: 'I am Hippie',
              color: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndScreen(
                      opacity: true,
                      noSpace: false,
                      backgroundColor: Colors.green[700],
                      title: 'I am Who I am',
                      textColor: Colors.white54,
                      text:
                          'I\'m Rich, I\'m Poor, I\'m Free & I\'m Who I Wanna Be!!!',
                      backImage: 'images/hippie.jpg',
                    ),
                  ),
                );
              },
            ),
            ButtonWidget(
              title: 'I am Ghost',
              color: Colors.transparent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EndScreen(
                      noSpace: false,
                      opacity: false,
                      titleColor: Colors.black,
                      backgroundColor: Colors.blueGrey,
                      title: 'I am Ghost',
                      textColor: Colors.white,
                      text:
                          'Life so Damn Hard, I Wish I Could Dissapear!\nGod says: Life is Too Short to be Miserable.',
                      backImage: 'images/ghost.jpg',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

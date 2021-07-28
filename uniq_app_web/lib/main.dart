import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../models/card.dart';

import 'pages/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'uniQ App Store',
          home: HomePage(),
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Lora',
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              bodyText2: TextStyle(color: Colors.grey, wordSpacing: 1.5, letterSpacing: 1),
              headline6: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      );
}

class CustomBody extends StatelessWidget {
  const CustomBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.blue,
            padding: EdgeInsets.only(top: 60),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, i) {
                    return Image(
                      alignment: Alignment.bottomRight,
                      image: AssetImage('images/sky/$i.jpg'),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            width: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // CustomCard(title: 'Experience', text: kOurExperience),
                  // CustomCard(title: 'Community', text: kCommunity),
                  // CustomCard(title: 'Your Idea', text: kYourIdea),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        borderOnForeground: true,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 230,
          width: 300,
          child: Column(
            children: [
              Text(
                myCards[i].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.grey[700]),
              ),
              Divider(color: Colors.grey, indent: 10, endIndent: 10),
              Text(
                myCards[i].text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBall extends StatelessWidget {
  const TextBall({
    Key key,
    @required this.title,
    @required this.text,
    @required this.align,
    this.color,
  }) : super(key: key);

  final String title, text;
  final AlignmentGeometry align;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Align(
        alignment: align,
        child: CircleAvatar(
          maxRadius: 150,
          backgroundColor: color ?? Colors.orange,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '$title\n\n',
                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
                children: [
                  TextSpan(
                    text: text,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.grey[200]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

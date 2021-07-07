import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'screens/home.dart';

void main() => runApp(BookApp());

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
          home: Home(),
          title: 'Book Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'OpenSansCondensed',
            iconTheme: IconThemeData(color: Colors.white, size: 28),
            textTheme: TextTheme(
              bodyText1: TextStyle(fontSize: 19, height: 1.6),
              headline6: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
              subtitle1: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      );
}

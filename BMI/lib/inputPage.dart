import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconContent.dart';
import './reuseableCard.dart';
import './constants.dart';
import './resultsPage.dart';
import 'calculation.dart';

enum Gender {
  male,
  female,
}
Gender selectedGender;
int height = 165;
int weight = 55;
int age = 20;
int g;
String header = 'ProFitErol Way BMI';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            header,
          ),
        ),
      ),
    );
  }
}

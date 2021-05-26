import 'dart:math';
import 'inputPage.dart';

class Calculation {
  Calculation({this.height, this.weight, this.age, this.gender});

  final int height;
  final int weight;
  final int age;
  final int gender;

  double _bmi;

  String sumBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getGender() {
    return gender == 1 ? 'MALE' : 'FEMALE';
  }

  String getAge() {
    return age.toString();
  }

  String getStringResult() {
    if (_bmi >= 25) {
      return 'Maybe it\'s time to stop eating and start exercises or maybe start a new diet!!!';
    } else if (_bmi > 18.5) {
      return 'Well done mate you have been looking after yourself well. keep doing whatever you are doing.';
    } else {
      return 'Oh you poor thing I don\'t know what or who to blaim for this result. Is that drugs or your ex?';
    }
  }
}

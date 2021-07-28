import 'package:flutter/material.dart';

import '../constants.dart';

class Cardo {
  final int id;
  final String title, text;

  Cardo({
    @required this.id,
    @required this.title,
    @required this.text,
  });
}

List<Cardo> myCards = [
  Cardo(id: 1, title: 'Our Experience', text: kOurExperience),
  Cardo(id: 2, title: 'Community', text: kCommunity),
  Cardo(id: 3, title: 'Your Idea', text: kYourIdea),
];

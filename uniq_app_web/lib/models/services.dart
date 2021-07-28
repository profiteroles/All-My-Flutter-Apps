import 'package:flutter/material.dart';

class Service {
  final int id;
  final String title, imagePath;
  final Color color;

  Service({
    @required this.id,
    @required this.title,
    @required this.imagePath,
    @required this.color,
  });
}

List<Service> services = [
  Service(
    id: 1,
    title: 'Graphic Design',
    imagePath: 'images/services/1.png',
    color: Color(0xFFD9FFFC),
  ),
  Service(
    id: 2,
    title: 'Web Sites',
    imagePath: 'images/services/2.png',
    color: Color(0xFFE4FFC7),
  ),
  Service(
    id: 3,
    title: 'App Development',
    imagePath: 'images/services/3.png',
    color: Color(0xFFFFF3DD),
  ),
  Service(
    id: 4,
    title: 'Interaction Design',
    imagePath: 'images/services/4.png',
    color: Color(0xFFFFE0E0),
  ),
];

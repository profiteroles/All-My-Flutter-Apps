import 'package:flutter/material.dart';
import '../../../models/services.dart';
import '../../../constants.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) => setState(() => isHover = value),
      hoverColor: Colors.transparent,
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.symmetric(vertical: kDPad * 2),
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          color: services[widget.index].color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.all(kDPad * 1.5),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  if (!isHover)
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 30,
                      color: Colors.black.withOpacity(0.1),
                    ),
                ],
              ),
              child: Image.asset(
                services[widget.index].imagePath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: kDPad),
            Text(
              services[widget.index].title,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}

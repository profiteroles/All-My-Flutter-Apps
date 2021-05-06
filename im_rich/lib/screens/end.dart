import 'package:flutter/material.dart';

class EndScreen extends StatelessWidget {
  static const String id = 'rich';

  final String title, text;
  final String backImage, image;
  final bool opacity, noSpace;
  final Color textColor, titleColor, backgroundColor;

  EndScreen(
      {this.image,
      @required this.opacity,
      this.titleColor,
      this.backImage,
      @required this.title,
      this.text,
      @required this.noSpace,
      this.textColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          backgroundColor != null ? backgroundColor : Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            title,
            style: TextStyle(
                color: titleColor != null ? titleColor : Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              backImage != null
                  ? Image.asset(backImage, fit: BoxFit.cover)
                  : Container(),
              image != null
                  ? Image.asset(
                      image,
                      height: 200,
                    )
                  : Container(),
              opacity
                  ? Container(
                      height: 150,
                      decoration: (BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green[900].withOpacity(0.2).withAlpha(4),
                            Colors.green[700].withOpacity(1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      )),
                    )
                  : Container(),
              title == 'I am Ghost'
                  ? Text(
                      text,
                      style: TextStyle(
                        fontSize: noSpace
                            ? MediaQuery.of(context).size.height / 25
                            : 45,
                        color: textColor != null ? textColor : null,
                        fontFamily: 'Merienda',
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Container(),
            ],
          ),
          title != 'I am Ghost'
              ? Text(
                  text,
                  style: TextStyle(
                    fontSize:
                        noSpace ? MediaQuery.of(context).size.height / 25 : 45,
                    color: textColor != null ? textColor : null,
                    fontFamily: 'Merienda',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                )
              : Container(),
        ],
      ),
    );
  }
}

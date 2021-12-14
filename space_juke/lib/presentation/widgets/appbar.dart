import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class JukeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final IconData icon;
  final bool hasLead;
  @override
  final Size preferredSize;

  JukeAppBar(
    this.title, {
    Key? key,
    this.hasLead = false,
    // required this.icon,
  })  : preferredSize = Size.fromHeight(90.0),
        super(key: key);

  ShapeBorder kBackButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // TODO: Background Transparent
        color: Colors.transparent,
        child: Column(
          children: <Widget>[
            SizedBox(height: Get.height * 0.035),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                hasLead
                    ? Hero(
                        tag: 'back',
                        child: Card(
                          elevation: 4,
                          shape: kBackButtonShape,
                          child: MaterialButton(
                            height: 50,
                            minWidth: 90,
                            shape: kBackButtonShape,
                            onPressed: Get.back,
                            child: Icon(Icons.arrow_back_ios_new, size: 40),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Hero(
                  tag: 'title',
                  transitionOnUserGestures: true,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: SizedBox(
                      width: Get.width / 1.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(title, style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class JukeAppBarOld extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final Function onPressed;
  final bool hasLead;
  // final Function onTitleTapped;

  @override
  final Size preferredSize;

  JukeAppBarOld({
    Key? key,
    required this.title,
    // required this.onPressed,
    this.hasLead = false,
  })  : preferredSize = Size.fromHeight(70.0),
        super(key: key);

  ShapeBorder kBackButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomRight: Radius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        hasLead
            ? Positioned(
                left: 0,
                child: Hero(
                  tag: 'back',
                  child: Card(
                    elevation: 4,
                    shape: kBackButtonShape,
                    child: MaterialButton(
                      height: 50,
                      shape: kBackButtonShape,
                      onPressed: Get.back,
                      child: Icon(Icons.arrow_back_ios_new, size: 30),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
        Hero(
          tag: 'title',
          transitionOnUserGestures: true,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(40),
              ),
            ),
            child: SizedBox(
              width: Get.width / 1.5,
              height: 50,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(title, style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

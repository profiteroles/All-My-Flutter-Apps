import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      endIndent: 20,
      indent: 20,
      thickness: 2,
      color: Colors.grey,
    );
  }
}

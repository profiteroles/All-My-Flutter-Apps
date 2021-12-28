import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class Header extends StatelessWidget {
  const Header(this.title, {Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 2.0.wp),
      child: Text(title, style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}

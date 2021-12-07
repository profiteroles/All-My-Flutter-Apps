import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class JukeMaterialBtn extends StatelessWidget {
  const JukeMaterialBtn({
    Key? key,
    required this.height,
    required this.title,
    required this.onPressed,
    required GlobalKey<FormBuilderState> fbKey,
  })  : _fbKey = fbKey,
        super(key: key);

  final double height;
  final GlobalKey<FormBuilderState> _fbKey;
  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      shape: StadiumBorder(),
      color: Theme.of(context).primaryColor,
      child: Center(child: Text(title, style: TextStyle(fontSize: 30, color: Theme.of(context).canvasColor))),
      onPressed: onPressed,
    );
  }
}

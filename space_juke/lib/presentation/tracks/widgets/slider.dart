import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class JukeSlider extends StatelessWidget {
  const JukeSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderSlider(
      name: 'length',
      initialValue: 3.5,
      min: 1,
      max: 10,
      decoration: InputDecoration(
        label: Text('Length', style: Theme.of(context).textTheme.headline6),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
    );
  }
}

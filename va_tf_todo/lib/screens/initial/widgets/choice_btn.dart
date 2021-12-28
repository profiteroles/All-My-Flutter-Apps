import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ChoiceBtn extends StatelessWidget {
  const ChoiceBtn({
    Key? key,
    required this.label,
    required this.elevation,
    this.selected,
    required this.onSelected,
  }) : super(key: key);
  final Widget label;
  final double elevation;
  final bool? selected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: label,
      elevation: elevation,
      selectedColor: Theme.of(context).primaryColorDark,
      backgroundColor: Theme.of(context).canvasColor,
      selected: selected ?? false,
      onSelected: onSelected,
      pressElevation: elevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 2.0.wp),
    );
  }
}

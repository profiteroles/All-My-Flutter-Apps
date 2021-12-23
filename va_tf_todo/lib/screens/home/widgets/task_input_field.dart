import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class TaskInputField extends StatelessWidget {
  const TaskInputField({
    Key? key,
    required this.controller,
    this.title,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? suffixIcon, prefixIcon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.wp),
      child: TextFormField(
        validator: (value) => value!.trim().isEmpty ? 'Title is required' : null,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefix: prefixIcon,
          labelText: title ?? 'Title',
        ),
      ),
    );
  }
}

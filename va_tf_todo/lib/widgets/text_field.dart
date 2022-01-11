import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class XTextField extends StatefulWidget {
  const XTextField({
    required this.hint,
    this.icon,
    this.radius = 8,
    this.obscure = false,
    this.type = TextInputType.text,
    this.controller,
    this.hasIcon = true,
    required this.validator,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final String hint;
  final TextInputType type;
  final double radius;
  final bool hasIcon, obscure;
  final TextEditingController? controller;
  final List<String? Function(String?)> validator;

  @override
  State<XTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  bool obscure = true;
  final signingCtrl = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.hp),
      child: FormBuilderTextField(
        textCapitalization: widget.hint == 'Full Name' ? TextCapitalization.words : TextCapitalization.none,
        controller: widget.controller,
        name: widget.hint.toLowerCase().replaceAll(' ', '_'),
        obscureText: widget.obscure ? obscure : false,
        keyboardType: widget.type,
        validator: FormBuilderValidators.compose(widget.validator),
        decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          contentPadding: EdgeInsets.all(widget.hasIcon ? 0 : 15),
          prefixIcon: Icon(widget.icon ?? Icons.lock_outline),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius)),
          hintText: widget.hint,
          suffixIcon: widget.obscure
              ? IconButton(
                  onPressed: () => setState(() => obscure = !obscure),
                  icon: Icon(obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                )
              : null,
        ),
      ),
    );
  }
}

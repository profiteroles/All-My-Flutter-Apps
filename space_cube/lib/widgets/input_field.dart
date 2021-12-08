import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class JukeInputField extends StatelessWidget {
  const JukeInputField({
    required this.title,
    required this.hint,
    required this.icon,
    this.radius = 30,
    this.obscure = false,
    this.required = true,
    this.emailValid = false,
    this.passValid = false,
    this.nameValid = false,
    this.passConfirm = '',
    this.inputType = TextInputType.text,
    this.controller,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title, hint, passConfirm;
  final TextInputType inputType;
  final double radius;
  final bool obscure, required, emailValid, passValid, nameValid;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: controller,
      name: title.toLowerCase().replaceAll(' ', '_'),
      obscureText: obscure,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: title,
        prefixIcon: Icon(icon),
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      ),
      validator: FormBuilderValidators.compose([
        if (emailValid) FormBuilderValidators.email(context),
        if (required) FormBuilderValidators.required(context),
        if (passValid) FormBuilderValidators.minLength(context, 8, errorText: 'Minimum 8 Characters'),
        if (passConfirm.length > 7) FormBuilderValidators.match(context, passConfirm),
        if (nameValid)
          (value) {
            if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
              return 'Looks like your name is quite special';
            }
          }
      ]),
    );
  }
}

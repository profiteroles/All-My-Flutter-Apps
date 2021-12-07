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
    this.inputType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title, hint;
  final TextInputType inputType;
  final double radius;
  final bool obscure, required, emailValid, passValid;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
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
        if (passValid) FormBuilderValidators.minLength(context, 6, errorText: 'Minimum 8 Characters'),
      ]),
    );
  }
}

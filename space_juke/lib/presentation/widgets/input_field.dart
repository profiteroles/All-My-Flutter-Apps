import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class JukeInputField extends StatefulWidget {
  const JukeInputField({
    required this.title,
    required this.hint,
    this.icon,
    this.radius = 30,
    this.required = true,
    this.emailValid = false,
    this.passValid = false,
    this.nameValid = false,
    this.passConfirm = '',
    this.inputType = TextInputType.text,
    this.controller,
    this.hasIcon = true,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final String title, hint, passConfirm;
  final TextInputType inputType;
  final double radius;
  final bool required, emailValid, passValid, nameValid, hasIcon;
  final TextEditingController? controller;
  @override
  State<JukeInputField> createState() => _JukeInputFieldState();
}

class _JukeInputFieldState extends State<JukeInputField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: widget.controller,
      name: widget.title.toLowerCase().replaceAll(' ', '_'),
      obscureText: widget.passValid ? obscure : false,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        labelText: widget.title,
        labelStyle: Theme.of(context).textTheme.headline6,
        contentPadding: EdgeInsets.all(widget.hasIcon ? 0 : 15),
        prefixIcon: widget.hasIcon ? Icon(widget.icon) : null,
        suffixIcon: widget.passValid
            ? IconButton(
                onPressed: () => setState(() => obscure = !obscure),
                icon: Icon(obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
              )
            : null,
        hintText: widget.hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius)),
      ),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(context),
          if (widget.emailValid) FormBuilderValidators.email(context),
          if (widget.passValid) FormBuilderValidators.minLength(context, 8, errorText: 'Minimum 8 Characters'),
          if (widget.passConfirm.length > 7) FormBuilderValidators.match(context, widget.passConfirm),
          if (widget.nameValid)
            (value) {
              if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
                return 'Looks like your name is quite special';
              }
            }
        ],
      ),
    );
  }
}

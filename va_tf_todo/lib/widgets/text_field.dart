import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/screens/singing/controller.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class XTextField extends StatefulWidget {
  const XTextField({
    required this.hint,
    this.icon,
    this.radius = 8,
    // this.required = true,
    // this.emailValid = false,
    this.passValid = false,
    // this.nameValid = false,
    // this.passConfirm = '',
    this.type = TextInputType.text,
    this.controller,
    this.hasIcon = true,
    required this.validator,
    Key? key,
  }) : super(key: key);

  final IconData? icon;
  final String hint; //, passConfirm;
  final TextInputType type;
  final double radius;
  // final bool required, emailValid, passValid, nameValid, hasIcon;
  final bool hasIcon, passValid;
  final TextEditingController? controller;
  final List<String? Function(String?)> validator;

  @override
  State<XTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  bool obscure = true;
  final signingCtrl = Get.find<SigningController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.hp),
      child: FormBuilderTextField(
        controller: widget.controller,
        name: widget.hint.toLowerCase().replaceAll(' ', '_'),
        obscureText: widget.passValid ? obscure : false,
        keyboardType: widget.type,
        decoration: InputDecoration(
          labelText: widget.hint,
          labelStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          contentPadding: EdgeInsets.all(widget.hasIcon ? 0 : 15),
          prefixIcon: Icon(widget.icon ?? Icons.lock_outline),
          suffixIcon: widget.passValid
              ? IconButton(
                  onPressed: () => setState(() => obscure = !obscure),
                  icon: Icon(obscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye),
                )
              : null,
          hintText: widget.hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.radius)),
        ),
        validator: FormBuilderValidators.compose(widget.validator
            // [
            //   FormBuilderValidators.required(context),
            //   if (widget.emailValid) FormBuilderValidators.email(context),
            //   if (widget.passValid) FormBuilderValidators.minLength(context, 8, errorText: 'Minimum 8 Characters'),
            //   if (widget.passConfirm.length > 7) FormBuilderValidators.match(context, widget.passConfirm),
            //   if (widget.nameValid)
            //     (value) {
            //       if (RegExp(r'[.,!@#$<>?":_`~;[\]\\|=+)(**&^%0-9-]').hasMatch(value!)) {
            //         return 'Looks like your name is quite special';
            //       }
            //     }
            // ],
            ),
      ),
    );
  }
}

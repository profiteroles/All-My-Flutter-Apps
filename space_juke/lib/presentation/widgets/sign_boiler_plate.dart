import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:space_juke/values/constants.dart';
import 'alternative_sing_button.dart';

class SignBoilerPlate extends StatelessWidget {
  const SignBoilerPlate({
    Key? key,
    required GlobalKey<FormBuilderState> fbKey,
    required this.height,
    this.isSignUpPage = true,
    required this.children,
  })  : _fbKey = fbKey,
        super(key: key);

  final GlobalKey<FormBuilderState> _fbKey;
  final double height;
  final List<Widget> children;
  final bool isSignUpPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Hero(tag: 'logo', child: Center(child: Image.asset(LOGO, height: height * (isSignUpPage ? 0.20 : 0.30)))),
          FormBuilder(
            key: _fbKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [...children],
            ),
          ),
          AlternativeSingBtn(isSignUp: !isSignUpPage),
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/instance_manager.dart';
import '../../application/state/auth_state.dart';
import '../../widgets/sign_boiler_plate.dart';
import '../../widgets/material_button.dart';
import '../../widgets/input_field.dart';
import '../../widgets/appbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _fbKey = GlobalKey<FormBuilderState>();
  // final AuthState _authState = Get<AuthState>();
  // get<AuthState>();

  _submitSignIn() async {
    // _authState.signIn(email: _fbKey.currentState!.value['email'], password: _fbKey.currentState!.value['password']);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: JukeAppBar(),
      body: SignBoilerPlate(
        fbKey: _fbKey,
        height: height,
        isSignUpPage: false,
        children: [
          JukeInputField(title: 'Email', hint: 'youremail@example.com', icon: Icons.email, emailValid: true, inputType: TextInputType.emailAddress),
          SizedBox(height: height * 0.02),
          JukeInputField(title: 'Password', hint: 'Password', icon: Icons.lock, obscure: true, passValid: true),
          SizedBox(height: height * 0.03),
          JukeMaterialBtn(
            height: height * 0.06,
            fbKey: _fbKey,
            title: 'Sign In',
            onPressed: () async {
              _fbKey.currentState?.save();
              if (_fbKey.currentState!.validate()) {
                var data = _fbKey.currentState!.value;
                print(data);
                Dio dio = Dio();
                Response response = await dio.post('http://localhost/api/login', data: data);
                print(response);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Yaay Bitch'),
                  backgroundColor: Colors.pink,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}

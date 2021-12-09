import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/route_manager.dart';
import '../../routes/routes.dart';
import '../../application/state/juke_api.dart';
import '../../widgets/snackbar_error.dart';
import '../../widgets/input_field.dart';
import '../../widgets/material_button.dart';
import '../../widgets/appbar.dart';
import '../../widgets/sign_boiler_plate.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fbKey = GlobalKey<FormBuilderState>();
  final _controller = TextEditingController();

  Future<void> _submitSignUp() async {
    _fbKey.currentState?.save();
    if (_fbKey.currentState!.validate()) {
      var data = _fbKey.currentState!.value;
      print(data);
      try {
        var response = await JukeAPI.dio.post('register', queryParameters: data);
        print(response);

        if (response.statusCode == 201) {
          Get.offNamed(JukeRoutes.home);
        }
      } on DioError catch (e) {
        if (e.response == null) {
          print('more shit');
          snackbarError('Check Your Internet Connection');
        }
        print(e.response);
        snackbarError(e.response!.data['message']);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: JukeAppBar(),
      body: SignBoilerPlate(
        fbKey: _fbKey,
        height: height,
        isSignUpPage: true,
        children: [
          JukeInputField(title: 'Full Name', hint: 'Your Name', icon: Icons.person, nameValid: true),
          SizedBox(height: height * 0.02),
          JukeInputField(title: 'Email', hint: 'youremail@example.com', icon: Icons.email, emailValid: true, inputType: TextInputType.emailAddress),
          SizedBox(height: height * 0.02),
          JukeInputField(
            controller: _controller,
            title: 'Password',
            hint: 'Password',
            icon: Icons.lock,
            passValid: true,
          ),
          SizedBox(height: height * 0.02),
          JukeInputField(
            title: 'Password Confirmation',
            hint: 'Confirm Password',
            icon: Icons.lock,
            passValid: true,
            passConfirm: _controller.text,
          ),
          SizedBox(height: height * 0.03),
          JukeMaterialBtn(height: height * 0.06, title: 'Sign Up', onPressed: _submitSignUp),
        ],
      ),
    );
  }
}

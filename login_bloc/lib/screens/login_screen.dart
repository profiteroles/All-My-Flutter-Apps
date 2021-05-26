import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child: Text('Login'),
          ),
          EmailField(bloc),
          PasswordField(bloc),
          SizedBox(height: 20),
          SubmitBtn(bloc),
        ],
      ),
    );
  }
}

Widget EmailField(Bloc bloc) {}

Widget PasswordField(Bloc bloc) {}

Widget SubmitBtn(Bloc bloc) {}

import 'package:deliverone/presentation/home/home.dart';
import 'package:deliverone/themes/theme.dart';
import 'package:flutter/material.dart';

const logoSize = 40.0;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -5,
                  right: -5,
                  height: size.width,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(size.width / 2),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: appGradients,
                        stops: [0.5, 1],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Positioned(
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).canvasColor,
                      radius: logoSize,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Username',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'username',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Password',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: InkWell(
              onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen())),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: appGradients,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

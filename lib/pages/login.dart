import 'package:flutter/material.dart';
import 'package:mystarship/components/animated_button.dart';
import 'package:mystarship/components/custom_textfield.dart';
import 'package:mystarship/tools/constants.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double widthRatio = size.width / 420;
    double heightRatio = size.height / 933.6;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80 * heightRatio),
              Icon(
                Icons.lock,
                size: 128 * widthRatio,
                color: lightColor,
              ),
              SizedBox(height: 64 * heightRatio),
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: lightColor,
                  fontSize: 18 * widthRatio,
                ),
              ),
              SizedBox(height: 32 * heightRatio),
              CustomTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
                widthRatio: widthRatio,
              ),
              SizedBox(height: 16 * heightRatio),
              CustomTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
                widthRatio: widthRatio,
              ),
              SizedBox(height: 16 * heightRatio),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32 * widthRatio),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style:
                          TextStyle(color: subColor, fontSize: 18 * widthRatio),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 48 * heightRatio),
              AnimatedButton(
                onTapUp: () {},
                variant: 'text',
                widthRatio: widthRatio,
                text: 'Sign In',
              )
            ],
          ),
        ),
      ),
    );
  }
}

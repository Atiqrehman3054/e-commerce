import 'package:e_commerce_app/Controller/auth_control.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

mixin InputValidationMixin {
  bool isPasswordValid(String password){
    return password.length == 6;
  }

  bool isEmailValid(String email) {
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }
}


class _SignupScreenState extends State<SignupScreen> with InputValidationMixin{

  late String email,password,username,phone;
  AuthController authController = Get.find();
  final formGlobalKey = GlobalKey<FormState>();

  signUp(){
    authController.signUp(email, password, username);
  }


  bool _checkbox = false;
  SizedBox fixsize = const SizedBox(
    height: 10,
  );
  SizedBox fixsize1 = const SizedBox(
    width: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPagebackgroundcolor,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(0, -10, 0),
                child: Image.asset("assets/images/background.png"),
              ),
              Container(
                alignment: Alignment.center,
                transform: Matrix4.translationValues(0, 125, 0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create your account",
                        style: HeadingText.copyWith(
                            color: kTextColor, fontWeight: FontWeight.bold),
                      ),
                      fixsize,
                      fixsize,
                      fixsize,
                      AuthButton(
                        fixsize1: fixsize1,
                        image: 'Vector.svg',
                        color: const Color(0xFF8E97FD),
                        onpressed: () {},
                        name: 'CONTINUE WITH FACEBOOK',
                      ),
                      fixsize,
                      fixsize,
                      AuthButton(
                          image: "icon.svg",
                          name: "CONTINUE WITH GOOGLE",
                          color: Colors.white,
                          onpressed: () {},
                          fixsize1: fixsize1),
                      fixsize,
                      fixsize,

                      const Text(
                        "OR SIGNUP IN WITH EMAIL",
                        style: TextStyle(
                          color: kLightText,
                        ),
                      ),
                      fixsize,
                      fixsize,

                      Textfeild_Widget(
                        name: "Name",
                      ),
                      fixsize,
                      fixsize,
                      Textfeild_Widget(
                        name: "Email Address",
                      ),
                      fixsize,
                      fixsize,
                      Password_Widget(),

                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 140,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Don\'t have an account?  ',
                        style: TextStyle(
                          color: kLightText,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Privace Policy',
                            style: TextStyle(
                                color: kBackgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: _checkbox,
                      onChanged: (value) {
                        setState(() {
                          _checkbox = true;
                        });
                      },
                    ),
                  ],
                ),
                fixsize,
                fixsize,
                AppButton(name: "Get Started", onpressed: (){
                  Get.to(LoginScreen());
                }),
              ],
            ),
          ),

        ],
      ),
    );
  }
}


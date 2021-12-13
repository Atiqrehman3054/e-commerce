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

  late String email,password,username;
  AuthController authController = Get.put(AuthController());
  final formGlobalKey = GlobalKey<FormState>();

  signUp(){
    print("calling the signUp");
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
      body: Form(
        key: formGlobalKey,
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  transform: Matrix4.translationValues(0, -10, 0),
                  child: Image.asset("assets/images/background.png"),
                ),
                Padding(
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
                        validator: (name){
                          if(name == ""){
                            return 'Please Enter the Name';
                          }
                        },
                        onChange: (value) {
                          username = value;
                        },
                        textInputType: TextInputType.name,
                        obscureTextBool: false,
                      ),
                      fixsize,
                      fixsize,
                      Textfeild_Widget(

                        validator: (email){
                          if(isEmailValid(email!)){
                            return null;
                          }else {
                            return 'Enter a valid email';
                          }
                        },
                        onChange: (value) {
                          email = value;
                        },
                        textInputType: TextInputType.emailAddress,
                        obscureTextBool: false,
                        name: "Email",
                      ),
                      fixsize,
                      fixsize,
                      Password_Widget(
                        validator: (value){
                          RegExp regex =
                          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                        },
                        onChange: (value) {
                          password = value;
                        },
                     ),

                    ],
                  ),
                ),
              ],
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
                    if(formGlobalKey.currentState!.validate()){
                      signUp();

                    }


                  }),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


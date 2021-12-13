import 'package:e_commerce_app/Controller/auth_control.dart';
import 'package:e_commerce_app/screens/sign_up.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late bool _passwordVisible;
  bool _checkbox = false;

  late String email , password;
  AuthController authController = Get.put(AuthController());

  login() {
    authController.login(email, password);
  }



  @override
  void initState() {
    _passwordVisible = false;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPagebackgroundcolor,
      body: ListView(
        children: [
          const SizedBox(
            height: 200,
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
              )
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
fixsize,
fixsize,

                  Text(
                    "Wellcome Back!",
                    style: HeadingText.copyWith(
                        color: kTextColor, fontWeight: FontWeight.bold),
                  ),

                  fixsize,
                  fixsize,
                  const Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 10),
                    child: Text(
                      "LOG IN WITH EMAIL",
                      style: TextStyle(
                        color: kLightText,
                      ),
                    ),
                  ),


                  Textfeild_Widget(
                    validator: (value){

                    },
                    onChange: (value) {
                      email = value;
                    },
                    textInputType: TextInputType.emailAddress,
                    obscureTextBool: false,
                    name: "Email Address",
                  ),

                  fixsize,

                  fixsize,Password_Widget(
                    validator: (value){

                    },

                    onChange: (value) {
                      password = value;
                    },
                  ),

                  fixsize,
                  fixsize,
                  AppButton(name: "Login", onpressed: login),


                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "CREATE NEW ACCOUNT? ",
                        style: TextStyle(color: kLightText),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.to(SignupScreen());
                        }
                        ,
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: kBackgroundColor),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          )



        ],
      ),
    );
  }
}
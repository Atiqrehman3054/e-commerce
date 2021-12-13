import 'package:e_commerce_app/Controller/auth_control.dart';
import 'package:e_commerce_app/Controller/data_controller.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';



class UpdateScreen extends StatelessWidget {
   UpdateScreen( {   Key? key}) : super(key: key);


   DataController dataController = Get.put(DataController());
   AuthController authController = Get.put(AuthController());


   String? name;
   String? email;
  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        centerTitle: true,
        title: const Text("Update",style: TextStyle(
             color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,

        ),),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 50),
          child: Column(
            children: [

              const Padding(
                padding: EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  "Update Email Password",
                  style: TextStyle(
                    color: kLightText,
                  ),
                ),
              ),

              Textfeild_Widget(
                validator: (value){

                },
                onChange: (value) {
                  name=value;
                },
                textInputType: TextInputType.emailAddress,
                obscureTextBool: false,
                name: "Name",
              ),
              fixsize,
              fixsize,
              fixsize,
              Textfeild_Widget(
                validator: (value){

                },
                onChange: (value) {
                  email = value;
                },
                textInputType: TextInputType.emailAddress,
                obscureTextBool: false,
                name: "Email_Address",
              ),
              fixsize,
              fixsize,
              AppButton(name: "Update", onpressed: ()async{

               await dataController.NameUpdate(name!, email);
               Get.back();
              })


            ],
          ),
        ),
      ),
    ));
  }
}

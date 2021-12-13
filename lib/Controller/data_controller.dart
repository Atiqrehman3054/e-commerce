import 'dart:io';
import 'package:e_commerce_app/Model/product_modell.dart';
import 'package:e_commerce_app/widgets/dialog_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'auth_control.dart';

class DataController extends GetxController {

  List<Product> loginUserData = [];

  final firebaseInstance = FirebaseFirestore.instance;
  String name = "";

  User? current;

  AuthController authController = Get.find();

  void onReady() {
    super.onReady();
    getUserProfileData();
  }

  Future<void> getUserProfileData() async {
    try {
      var response = await firebaseInstance
          .collection('userslist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();
      name = response.docs[0]['user_name'];
      print(name);
    } catch (e) {
      print(e);
    }
  }

  Future<QuerySnapshot> UserData() async {
    var response = await firebaseInstance
        .collection('userslist')
        .where('user_Id', isEqualTo: authController.userId)
        .get();
    name = response.docs[0]['user_name'];
    print(name);
    print("*********************************");
    return response;
  }

Future<List> NameUpdate(String name, email) async {
List<String> data= [];
  // print(authController.userId);
  var nameresponse = await firebaseInstance.collection("userslist").where('user_Id',isEqualTo: authController.userId).get();

  print("before saving: ${nameresponse.docs[0]['user_name']}");
  print("before saving: ${nameresponse.docs[0]['email']}");

  var collection = await firebaseInstance.collection('userslist');

  collection.doc(authController.userId).update(
    {'user_name': name},

  );
  collection.doc(authController.userId).update(
    {'email': email},

  );


   nameresponse = await firebaseInstance
      .collection("userslist")
      .where('user_Id', isEqualTo: authController.userId)
      .get();

  print("after saving: ${nameresponse.docs[0]['user_name']}");
  print("after saving: ${nameresponse.docs[0]['email']}");
data.add(nameresponse.docs[0]['user_name']);
data.add(nameresponse.docs[0]['email']);
  return data;

}


  Future<void> addNewProduct(Map productdata, File image) async {
    var pathimage = image.toString();
    var temp = pathimage.lastIndexOf('/');
    var result = pathimage.substring(temp + 1);
    print(result);
    final ref =
    FirebaseStorage.instance.ref().child('product_images').child(result);
    var response = await ref.putFile(image);
    print("Updated $response");
    var imageUrl = await ref.getDownloadURL();

    try {
      CommonDialog.showDialog();
      var response = await firebaseInstance.collection('productlist').add({
        'product_name': productdata['p_name'],
        'product_price': productdata['p_price'],
        "product_upload_date": productdata['p_upload_date'],
        'product_image': imageUrl,
        'user_Id': authController.userId,
        "phone_number": productdata['phone_number'],
      });
      print("Firebase response1111 $response");
      CommonDialog.hideLoading();
      Get.back();
    } catch (exception) {
      CommonDialog.hideLoading();
      print("Error Saving Data at firestore $exception");
    }
  }


  Future<void> getLoginUserProduct() async {
    print("loginUserData YEs $loginUserData");
    loginUserData = [];
    try {
      // CommanDialog.showLoading();
      final List<Product> lodadedProduct = [];
      var response = await firebaseInstance
          .collection('productlist')
          .where('user_Id', isEqualTo: authController.userId)
          .get();

      if (response.docs.length > 0) {
        response.docs.forEach(
              (result) {
            print(result.data());
            print("Product ID  ${result.id}");
            lodadedProduct.add(
              Product(
                  productId: result.id,
                  userId: result['user_Id'],
                  productname: result['product_name'],
                  productprice: double.parse(result['product_price']),
                  productimage: result['product_image'],
                  phonenumber: int.parse(result['phone_number']),
                  productuploaddate: result['product_upload_date'].toString()),
            );
          },
        );
      }
      loginUserData.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {

      CommonDialog.hideLoading();
      print("Error $e");
    } catch (error) {
      CommonDialog.hideLoading();
      print("error $error");
    }
  }


}

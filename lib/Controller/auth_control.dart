import 'package:e_commerce_app/screens/bottomnavigationbar.dart';
import 'package:e_commerce_app/screens/login_screen.dart';
import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:e_commerce_app/widgets/dialog_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var userId;




  Future<void> signUp(email, password, username) async {
    try {
      CommonDialog.showDialog();
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      print(userCredential);
      CommonDialog.hideLoading();
      try {
        CommonDialog.showDialog();
        var response = await FirebaseFirestore.instance.collection('userslist').doc(userCredential.user!.uid).set(
            {
              'user_Id': userCredential.user!.uid,
              'user_name': username,
              'password': password,
              'email': email,

            }
        );
        print("Inside the signUp");
        CommonDialog.hideLoading();
        Get.back();
      } catch (e) {
        print("inside the catch");
        CommonDialog.hideLoading();
        CommonDialog.showErrorDialog(description: "Error Saving data at FireStore $e");
      }

      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'weak-password') {
        CommonDialog.showErrorDialog(
            description: "The password provided is too weak.");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CommonDialog.showErrorDialog(
            description: "The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
      CommonDialog.hideLoading();
      CommonDialog.showErrorDialog(description: "Something went wrong");
    }
  }

  Future<void> login(email, password) async {
    try {
      CommonDialog.showDialog();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password: password,);
      print(userCredential.user!.uid);
      userId = userCredential.user!.uid;
      CommonDialog.hideLoading();
      Get.offAll( BottomNavigationScreen());
    } on FirebaseAuthException catch (e) {
      CommonDialog.hideLoading();
      if (e.code == 'user-not-found') {
        CommonDialog.showErrorDialog(
            description: "No user found for that email.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CommonDialog.showErrorDialog(
            description: "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    }
  }
}

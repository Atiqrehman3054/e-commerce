import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      // FutureBuilder(
      //   // Initialize FlutterFire:
      //   future: _initialization,
      //   builder: (context, snapshot) {
      //     // Check for errors
      //     if (snapshot.hasError) {
      //       return const Center(child: Text("App not Connected"));
      //     }
      //
      //     // Once complete, show your application
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return  const SplashScreen();
      //     }
      //
      //     // Otherwise, show something whilst waiting for initialization to complete
      //     return const Center(child: CircularProgressIndicator());
      //   },
      // ),
    );
  }
}

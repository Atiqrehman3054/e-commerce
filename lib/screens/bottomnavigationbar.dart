import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/screens/cart.dart';
import 'package:e_commerce_app/screens/homescreen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 1;
  List<Widget> tabs = [
    MyCart(
      add: false,
    ),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    tabs = [
      MyCart(add: false),
      HomeScreen(),
      ProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black12,
          items: const <Widget>[
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.blue,
            ),
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Icon(
                  Icons.home_filled,
                  size: 35,
                  color: Colors.blue,
                ),
              ),
            ),
            Icon(
              Icons.person_pin,
              size: 30,
              color: Colors.blue,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

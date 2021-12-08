// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:io';

SizedBox fixsize = const SizedBox(
  height: 10,
);
SizedBox fixsize1 = const SizedBox(
  width: 10,
);

Icon starIcon() {
  return Icon(
    Icons.star_border_rounded,
    color: Colors.red,
    size: 15,
  );
}

Icon starHalfIcon() {
  return Icon(
    Icons.star_half_rounded,
    color: Colors.red,
    size: 15,
  );
}

Container sizeContainerColour(Color color, String text) {
  return Container(
    width: 35,
    height: 25,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
    child: Center(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

CircleAvatar colorSelectionCircle(Color color) {
  return CircleAvatar(
    backgroundColor: color,
    radius: 10,
  );
}






const kBackgroundColor = Color(0xFF8E97FD);
const kBackgroundColor2 = Color(0xFF949DFF);
const sleepBackgroundColor = Color(0xFF03174C);

const kButtonTextColor = Color(0xFFFFECCC);
const ButtonTextColor = Color(0xFFF6F1FB);
const kTextColor = Color(0xFF3F414E);
const containerColor = Color(0xFF808AFF);
const containerbackground = Color(0xFFECD2D1);
const yellowrColor = Color(0xFFFFC97E);
const greenColor = Color(0xFFAFDBC5 );
const textColor = Color(0xFFFFE7BF);

const kLightText = Color(0xFFA1A4B2);
const k2ndTextdColor = Color(0xFFA1A4B2);
const kPagebackgroundcolor = Color(0xFFE5E5E5);
const Cardbackground = Color(0xFFA0A3B1);


var HeadingText = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  fontFamily: "asset/fonts",
  decoration: TextDecoration.none,
);
var HeadingText2 = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  fontFamily: "asset/fonts",
  decoration: TextDecoration.none,
);

var kLoginInputTextStyle = TextStyle(
  fontSize: 15.0,
  fontFamily: Platform.isIOS ? 'SF Pro Text' : null,
  decoration: TextDecoration.none,
  color: Colors.black.withOpacity(0.3),
);
const kPrimaryLabelColor = Color(0xFF242629);


var kTextContainer = TextStyle(
  color: kButtonTextColor,
  fontSize: 20,
  fontWeight: FontWeight.bold,);

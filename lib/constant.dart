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


class AppColors {
  static const baseDarkPinkColor = Color(0xff6930c3);
  static const baseLightPinkColor = Color(0xff9775fa);
  static const baseDarkGreenColor = Color(0xff23bd66);
  static const baseLightGreenColor = Color(0xff5dd136);
  static const baseDarkOrangeColor = Color(0xffff671c);
  static const baseLightOrangeColor = Color(0xffffa601);
  static const baseLightCyanColor = Color(0xff05c2bd);
  static const baseBlackColor = Color(0xff1b1b1d);
  static const baseGrey90Color = Color(0xff2d2d2f);
  static const baseGrey80Color = Color(0xff3c3c3e);
  static const baseGrey70Color = Color(0xff545455);
  static const baseGrey60Color = Color(0xff727273);
  static const baseGrey50Color = Color(0xff8d8d8e);
  static const baseGrey40Color = Color(0xffbababa);
  static const baseGrey30Color = Color(0xffd0d0d0);
  static const baseGrey20Color = Color(0xffe6e6e7);
  static const baseGrey10Color = Color(0xfff6f6f6);
  static const baseWhiteColor = Color(0xffffffff);
  static const basewhite60Color = Color(0xffF6F6F6);
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

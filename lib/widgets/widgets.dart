import 'package:flutter/material.dart';

import '../constant.dart';
import 'package:flutter_svg/svg.dart';


class AppButton extends StatelessWidget {
  AppButton({
    required this.name,
    required this.onpressed,

    Key? key,
  }) : super(key: key);
  String name;
  Function() onpressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kBackgroundColor,
          fixedSize:  const Size(360, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        onPressed: onpressed,
        child:  Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}


class Textfeild_Widget extends StatelessWidget {
  Textfeild_Widget({
    required this.name,
    Key? key,
  }) : super(key: key);

  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          cursorColor: Colors.black38,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: name,
            suffixIcon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ));
  }
}

class Password_Widget extends StatefulWidget {
  Password_Widget({
    Key? key,
  }) : super(key: key);

  @override
  State<Password_Widget> createState() => _Password_WidgetState();
}

class _Password_WidgetState extends State<Password_Widget> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          cursorColor: Colors.black38,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
          ),
          obscureText: !_passwordVisible,
        ));
  }
}

class AuthButton extends StatelessWidget {
  AuthButton({
    required this.image,
    required this.name,
    required this.color,
    required this.onpressed,
    Key? key,
    required this.fixsize1,
  }) : super(key: key);

  String image;
  String name;
  Color color;
  Function() onpressed;
  final SizedBox fixsize1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            fixsize1,
            fixsize1,
            SvgPicture.asset("assets/images/$image"),
            fixsize1,
            fixsize1,
            fixsize1,
            fixsize1,
            Text(
              name,
              style: const TextStyle(color: kTextColor),
            ),
          ],
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: color),
        height: 63,
        width: double.infinity,
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  String ratingController;
  final List<String> item;
  final String hinttext;

  DropButton(
      {Key? key,
      required this.item,
      required this.hinttext,
      required this.ratingController})
      : super(key: key);

  @override
  _DropButtonState createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: DropdownButtonFormField(
        isExpanded: true,
        items: widget.item
            .map(
              (e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ),
            )
            .toList(),
        onChanged: (value) {
          setState(() {
            widget.ratingController = value.toString();
          });
        },
        decoration: InputDecoration(
            fillColor: Colors.grey[100],
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
        hint: Text(
          widget.hinttext,
          style: TextStyle(color: Colors.black),
        ),
        value: widget.ratingController,
      ),
    );
  }
}

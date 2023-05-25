import 'package:flutter/material.dart';

class TabBTN extends StatelessWidget {
  TabBTN(
      {super.key,
      required this.text,
      required this.color,
      required this.borderColor});
  String text;
  Color color;
  Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: borderColor))),
      child: Text(
        text,
        style: TextStyle(color: color),
      ),
    );
  }
}

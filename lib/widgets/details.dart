import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Details({super.key, required this.details, required this.heading});
  String heading;
  String details;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(children: [
        Text(
          heading,
          style: TextStyle(color: Colors.grey),
        ),
        Expanded(child: Container()),
        Row(
          children: [
            Text(
              details,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ]),
    );
  }
}

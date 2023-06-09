import 'package:banklyapp/screens/details.dart';
import 'package:flutter/material.dart';

class CreditScreen extends StatelessWidget {
  CreditScreen(
      {super.key,
      required this.id,
      required this.cashColor,
      required this.trnAmount,
      required this.trnDate});
  Color cashColor;
  String trnAmount;
  String trnDate;
  String id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailsScreen.routeName, arguments: id),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(top: 40),
        height: 100,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFD3D3D3)))),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // icon
                Container(
                  child: Icon(
                    Icons.south_west,
                    size: 15,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFCFE7DD)),
                ),

                //column text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Transfer-Charge'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      trnDate,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                // text
                Text(
                  trnAmount,
                  style: TextStyle(color: cashColor),
                ),
              ]),
        ),
      ),
    );
  }
}

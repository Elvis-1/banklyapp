import 'package:banklyapp/data/api_client.dart';
import 'package:banklyapp/screens/details.dart';
import 'package:flutter/material.dart';

class AllScreen extends StatelessWidget {
  AllScreen(
      {super.key,
      required this.id,
      required this.cashColor,
      required this.trnAmount,
      required this.trnDate,
      required this.icon,
      required this.iconColor});
  Color cashColor;
  // int index;
  String trnAmount;
  String trnDate;
  Color iconColor;
  IconData icon;
  String id;
  // var apiClient = ApiClient().getTransactions();
  // void selectAudio(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(AudioScreen.routeName, arguments: id);
  // }

  @override
  Widget build(BuildContext context) {
    // var apiClient = ApiClient().getTransDetails("1");
    // print(apiClient.accountName);
    // var trans = ApiClient().transactions;
    // print('Here ' + trans[1]["trnAmount"].toString());

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(DetailsScreen.routeName, arguments: id),
      //Get.to(DetailsScreen()),
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
                    icon,
                    size: 15,
                  ),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: iconColor),
                ),
                // Icon(Icons.north_east),
                // Icon(Icons.south_west),
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

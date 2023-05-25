import 'package:flutter/material.dart';

import '../dimensions.dart';

class SearchBar extends StatelessWidget {
  SearchBar(
      {Key? key,
      required this.color,
      required this.text,
      required this.function})
      : super(key: key);
  Color color;
  String text;
  Function function;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: height * 0.08,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10 + 5),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: width * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  color: Color.fromARGB(255, 212, 222, 241)),
              child: Icon(
                (Icons.search),
                color: Color(0xFF296CF0),
              )),
          SizedBox(
            width: width * 0.05,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              // width: width * 0.1,
              child: Center(
                child: TextField(
                  onChanged: (value) => function(value),
                  obscureText: false,
                  // style: TextStyle(fontSize: Dimension.font20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        // top: Dimension.width10 / 2,
                        bottom: 7,
                        //left: Dimension.width10 / 2
                      ),
                      border: InputBorder.none,
                      //hintText: 'Search',
                      labelText: text,
                      labelStyle: TextStyle(fontSize: 15),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 212, 222, 241),
            ),
            child: Row(
              children: [
                Text('Filter'),
                SizedBox(width: width * 0.03),
                Image.asset("images/filter.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}

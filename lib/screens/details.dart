import 'package:banklyapp/data/api_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/details.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({
    super.key,
  });
  static const routeName = '/details-screen';
  // ApiClient apiClient = ApiClient();
  // @override

  // @override
  // void didChangeDependencies() {
  //   apiClient.getTransactions();
  //   print(apiClient.transactions);
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // ApiClient().getTransactions();

    final routeArgsId = ModalRoute.of(context)!.settings.arguments;
    final transDetails =
        Provider.of<ApiClient>(context).getTransDetails(routeArgsId);
    // var transDetails = apiClient.getTransDetails(routeArgsId);
    // print(transDetails);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFEEEEEE),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          //  Get.back(),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Transactions',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Container(
                height: height * 0.04,
                width: width * 0.08,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/cashcode.png"))),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Text(
                '10,0000',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              // DETAILS

              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Details(
                      heading: "Date and Time",
                      details: transDetails["trnDate"],
                      //,
                    ),
                    Details(
                      heading: "Reference",
                      details: transDetails["trnPaymentReference"],
                    ),
                    Details(
                      heading: "Type",
                      details: transDetails['trnDrCr'],
                    ),
                    Details(
                      heading: "Balance",
                      details: "22/05/2023 15:20:26PM",
                    ),
                    Details(
                      heading: "Naration",
                      details: transDetails['maker'],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: height * 0.08,
              ),

              // BUTTON

              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF296CF0)),
                height: height * 0.08,
                width: double.infinity,
                child: Center(
                    child: Text(
                  "Download Receipt",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Share with a bankly assistant",
                  style: TextStyle(
                      color: Color(0xFF296CF0), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

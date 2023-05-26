import 'package:banklyapp/dimensions.dart';
import 'package:banklyapp/screens/all.dart';
import 'package:banklyapp/screens/credit.dart';
import 'package:banklyapp/screens/debit.dart';
import 'package:banklyapp/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/api_client.dart';
import '../widgets/tab_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool all = true;
  bool credit = false;
  bool debit = false;
  // ApiClient apiClient = ApiClient();
  bool _isInit = true;

  // @override
  // void initState() {
  //   apiClient.getTransactions();
  //   // TODO: implement initState
  //   super.initState();
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit == true) {
      // Provider.of<VideoProvider>(context, listen: false).fetchVideo();
      Provider.of<ApiClient>(context).getTransactions();
      // Provider.of<EbookProvider>(context, listen: false).fetchAndSetEbook();
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // apiClient.getTransactions();
    var transactions = Provider.of<ApiClient>(context, listen: true);
    // var trans = transactions.transactions;
    var trans = transactions.trans;
    var cred = transactions.creditTransaction;
    var deb = transactions.debitTransactions;
    List foundUsers = [];

    // print(trans);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFEEEEEE),
        elevation: 0,
        title: Text(
          'Transactions',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            // search bar
            SearchBar(
                function: transactions.runFilter,
                color: Colors.white,
                text: "Search"),
            SizedBox(
              height: height * 0.02,
            ),
            // tab bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    all = true;
                    credit = false;
                    debit = false;
                  }),
                  child: TabBTN(
                      text: "All",
                      color: Colors.black,
                      borderColor:
                          all == true ? Colors.black : Color(0xFFEEEEEE)),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    all = false;
                    credit = true;
                    debit = false;
                  }),
                  child: TabBTN(
                      text: "credit",
                      color: Color(0xFF3CC13B),
                      borderColor: credit == true
                          ? Color(0xFF3CC13B)
                          : Color(0xFFEEEEEE)),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    all = false;
                    credit = false;
                    debit = true;
                  }),
                  child: TabBTN(
                      text: "debit",
                      color: Color(0xFFE92022),
                      borderColor: debit == true
                          ? Color(0xFFE92022)
                          : Color(0xFFEEEEEE)),
                ),
              ],
            ),
            // content

            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 20),
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: credit == true
                      ? cred.length
                      : debit == true
                          ? deb.length
                          : trans.length,
                  itemBuilder: (context, index) {
                    return all == true
                        ? trans.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : AllScreen(
                                id: trans[index]["trnId"],
                                iconColor: trans[index]["trnDrCr"] ==
                                            "payment" ||
                                        trans[index]["trnDrCr"] == "invoice" ||
                                        trans[index]["trnDrCr"] == "withdrawal"
                                    ? Color(0xFFFFE8EA)
                                    : Color(0xFFCFE7DD),
                                icon: trans[index]["trnDrCr"] == "payment" ||
                                        trans[index]["trnDrCr"] == "invoice" ||
                                        trans[index]["trnDrCr"] == "withdrawal"
                                    ? Icons.north_east
                                    : Icons.south_west,
                                trnDate: trans[index]["trnDate"],
                                trnAmount: trans[index]["trnDrCr"] ==
                                            "payment" ||
                                        trans[index]["trnDrCr"] == "invoice" ||
                                        trans[index]["trnDrCr"] == "withdrawal"
                                    ? '-' + trans[index]["trnAmount"]
                                    : trans[index]["trnAmount"],
                                cashColor: trans[index]["trnDrCr"] ==
                                            "payment" ||
                                        trans[index]["trnDrCr"] == "invoice" ||
                                        trans[index]["trnDrCr"] == "withdrawal"
                                    ? Color(0xFFE92022)
                                    : Color(0xFF3CC13B),
                              )
                        : credit == true
                            ? cred.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : CreditScreen(
                                    id: cred[index]["trnId"],
                                    trnDate: cred[index]["trnDate"],
                                    trnAmount: cred[index]["trnAmount"],
                                    cashColor: Color(0xFF3CC13B))
                            : deb.isEmpty
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : DebitScreen(
                                    id: deb[index]["trnId"],
                                    trnDate: deb[index]["trnDate"],
                                    trnAmount: deb[index]["trnAmount"],
                                    cashColor: Color(0xFFE92022));
                  }),
            ))
          ],
        ),
      ),
    );
  }
}

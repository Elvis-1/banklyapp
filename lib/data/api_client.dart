import 'dart:convert';

import 'package:banklyapp/model/transaction_list.dart';
import 'package:banklyapp/model/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiClient with ChangeNotifier {
  Map<String, String>? _mainHeaders;
  ApiClient() {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      "Accept": "application/json",
    };
  }

  List transactions = [];

  getTransDetails(id) {
    return transactions.firstWhere((element) {
      return element['trnId'] == id;
    });
  }

  List creditTransaction = [];
  List debitTransactions = [];

  Future<void> getTransactions() async {
    print('hreerrrrrrrrrrrrr');

    // String url = "https://itestify.ifnotgod.com/api/category/get_category";
    transactions = [];
    String url =
        "https://646b7d727d3c1cae4ce3e29f.mockapi.io/api/vi/transactions";
    var response;

    response = await http.get(Uri.parse(url), headers: _mainHeaders);
    //transactions.addAll(TransactionList.transaction.)
    List<dynamic> bd = jsonDecode(response.body);
    transactions.addAll(bd);
    // transactions
    //     .add(Transaction.fromJson(response.body as Map<String, dynamic>));
    // var decodedResponse = jsonDecode(response.body);
    debitTransactions = transactions
        .where((element) =>
            element['trnDrCr'] == "withdrawal" ||
            element['trnDrCr'] == "invoice" ||
            element['trnDrCr'] == "payment")
        .toList();
    creditTransaction = transactions
        .where((element) => element['trnDrCr'] == "deposit")
        .toList();
    notifyListeners();
    // var tr = getTransDetails('2');
    // print(transactions);
    // print(jsonDecode(response.body));
    // return response;
  }
}

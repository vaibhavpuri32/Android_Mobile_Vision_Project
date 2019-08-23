import 'package:flutter/material.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Providers/bills.dart';
import '../models/bill.dart';

class BillDetailScreen extends StatefulWidget {
  static const routeName = "bill-detail-screen";
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BillDetailScreen();
  }
}
  class _BillDetailScreen extends State<BillDetailScreen>{
  @override
  Widget build(BuildContext context) {

    final billData =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final String title = billData["title"];
    final File image = billData["image"];
    final double price = billData["price"];
    final DateTime time = billData["time"];
    final Id = billData["id"];
    return (Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Scanned on: " +
              DateFormat("dd / MM / yyyy  hh:mm ").format(time)),
          Container(
            height: 400,
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Rs. " + price.toString(),
            style:
                TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
          ),

        ],
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './add_bills_screen.dart';
import '../Providers/bills.dart';

class BillListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text("Your Bills "),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddBillsScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<Bills>(
          child: Center(
            child: const Text("All Paid, No Bills are Left"),
          ),
          builder: (context, bills, ch) => bills.items.length <= 0
              ? ch
              : ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          FileImage(bills.items[index].image),
                    ),
                    title: Text(bills.items[index].title),
                    onTap: () {},
                  ),
                  itemCount: bills.items.length,
                )),
    ));
  }
}

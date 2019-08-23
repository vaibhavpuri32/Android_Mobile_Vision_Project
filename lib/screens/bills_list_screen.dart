import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_drawer.dart';
import 'package:provider/provider.dart';
import './add_bills_screen.dart';
import '../Providers/bills.dart';
import './bill_detail_screen.dart';
import 'package:intl/intl.dart';

class BillListScreen extends StatelessWidget {
  static const routeName = "bill-list-screen";

  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Your Bills "),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddBillsScreen.routeName);
            },
          )
        ],
      ),
      //drawer: AppMainDrawer(),
      body: FutureBuilder(
          future: Provider.of<Bills>(context,listen: false).fetchBills(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<Bills>(
                      child: Center(
                        child: Text(
                          "All Paid, No Bills are Left !!",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 30),
                        ),
                      ),
                      builder: (context, bills, ch) => bills.items.length <= 0
                          ? ch
                          : ListView.builder(
                              itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.all(8),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        FileImage(bills.items[index].image),
                                  ),
                                  title: Text(
                                    bills.items[index].title,
                                    style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
                                  ), subtitle: Text(DateFormat("dd / MM / yyyy  hh:mm ").format(bills.items[index].time)),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        BillDetailScreen.routeName,
                                        arguments: {
                                          "title": bills.items[index].title,
                                          "image": bills.items[index].image,
                                          "time": bills.items[index].time,
                                          "price": bills.items[index].price,
                                          "id": bills.items[index].id
                                        });
                                  },
                                ),
                              ),
                              itemCount: bills.items.length,
                            ))),
    ));
  }
}

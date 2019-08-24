

import 'package:flutter/material.dart';
import '../screens/add_bills_screen.dart';
import '../screens/bills_list_screen.dart';

class MainDrawer extends StatelessWidget {
  static const routeName = "main-drawer";

  @override
  Widget build(BuildContext context) {
    return (Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Hello  !"),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.scanner),
              title: Text("Add a Bill", style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AddBillsScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Your Bills", style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(BillListScreen.routeName);
              },
            ),
            Divider(),
          ],
        )
    ));
  }


}


import 'package:flutter/material.dart';
import '../screens/add_bills_screen.dart';
import '../screens/bills_list_screen.dart';

class AppMainDrawer extends StatelessWidget {
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
              title: Text("Scan a Bill"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AddBillsScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text("Your Bills"),
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
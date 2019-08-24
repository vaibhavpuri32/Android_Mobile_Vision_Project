import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/bills.dart';
import './screens/bills_list_screen.dart';
import './screens/add_bills_screen.dart';
import './Widgets/main_drawer.dart';
import './screens/bill_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (ChangeNotifierProvider.value(
        value: Bills(),
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.pink, accentColor: Colors.amberAccent, fontFamily: "Lato"),
          home: BillListScreen(),
          routes: {AddBillsScreen.routeName: (context) => AddBillsScreen(),
                   BillListScreen.routeName: (context)=> BillListScreen(),
                   MainDrawer.routeName: (context)=> MainDrawer(),
                    BillDetailScreen.routeName: (context)=>BillDetailScreen()


          },
        )));
  }
}

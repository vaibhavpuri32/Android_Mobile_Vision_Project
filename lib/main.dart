import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/bills.dart';
import './screens/bills_list_screen.dart';
import './screens/add_bills_screen.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //FirebaseApp.initializeApp(context);
    return (ChangeNotifierProvider.value(
        value: Bills(),
        child: MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.indigo, accentColor: Colors.amber),
          home: BillListScreen(),
          routes: {AddBillsScreen.routeName: (context) => AddBillsScreen()},
        )));
  }
}

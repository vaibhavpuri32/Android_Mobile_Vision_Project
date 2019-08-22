import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/bill.dart';

class Bills extends ChangeNotifier {
  List<Bill> _items = [];
  //a getter function so that , whenever we perform any task on the List , we perform on the same List
  List<Bill> get items {
    return [..._items];
  }
  // a fuction which can add new Elements to the Bill
  void addBill(String pickedTitle, File pickedImage, double price) {
    final newBill = Bill(
        title: pickedTitle,
        image: pickedImage,
        id: DateTime.now().toString(),
        price: price);
    _items.add(newBill);
    notifyListeners();
  }
}

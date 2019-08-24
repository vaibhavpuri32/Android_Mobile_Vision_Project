import 'dart:io';
import 'package:flutter/foundation.dart';
import '../helper/db_helper.dart';
import '../models/bill.dart';

class Bills with ChangeNotifier {
  List<Bill> _items = [];

  List<Bill> get items {
    return [..._items];
  }

  void addBill(
      String pickedTitle, File pickedImage, double price, DateTime Time) {
    final newBill = Bill(
      id: DateTime.now().toString(),
      price: price,
      image: pickedImage,
      title: pickedTitle,
      time: Time,
    );
    _items.add(newBill);
    notifyListeners();
    DBHelper.insert("user_bills", {
      "id": newBill.id,
      "price": newBill.price,
      "image": newBill.image.path,
      "title": newBill.title,
      "time": newBill.time.toString()
    });
  }

  Future<void> fetchBills() async {
    final dataList = await DBHelper.getData("user_bills");
    _items = dataList
        .map((item) => Bill(
            id: item["id"],
            price: item["price"],
            image: File(item["image"]),
            title: item["title"],
            time: DateTime.parse(item["time"])))
        .toList();
    notifyListeners();
  }
}

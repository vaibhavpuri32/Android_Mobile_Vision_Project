import 'dart:io';

import 'package:flutter/foundation.dart';


class Bill {
  final String id;
  final String title;    // main title on the Bill
  final double price;    //Amount on the Bill
  final File image;      //Image Clicked

  Bill(
      {@required this.id,
      @required this.title,
      @required this.price,
      @required this.image});
}

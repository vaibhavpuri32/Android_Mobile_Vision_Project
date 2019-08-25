import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_drawer.dart';
import '../Providers/bills.dart';
import '../Widgets/image_input.dart';

class AddBillsScreen extends StatefulWidget {
  static const routeName = "app-detail-screen";

  @override
  State<StatefulWidget> createState() {
    return _AddBillsScreen();
  }
}

class _AddBillsScreen extends State<AddBillsScreen> {
  var numbers;
  final _titlecontroller = new TextEditingController();
  File _pickedImage;
  String bill = " ";

  void _selectimage(File pickedimage) {
    _pickedImage = pickedimage;
  }

  Future<void> readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(_pickedImage);
    TextRecognizer recognizeText = FirebaseVision.instance.textRecognizer();
    VisionText readText = await recognizeText.processImage(ourImage);

    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          bill = (bill + word.text.toString() + " ");
        }
      }
    }
    print(bill);
    print("\n");
    var doubleRE = RegExp(r"-?(?:\d*\.)?\d+(?:[eE][+-]?\d+)?");
    numbers = doubleRE.allMatches(bill).map((m) => double.parse(m[0])).toList();
    int i;
    for (i = 0; i < numbers.length; i++) {
      print(numbers[i]);
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {},
          child: Center(
            child: numbers.length > 0
                ? Text(
                    "The Bill is  Rs.  " +
                        numbers[numbers.length-1].toString(),
                    style: TextStyle(fontSize: 30, color: Theme.of(context).primaryColor),
                  )
                : Text(
                    "No Amount detected",
                    style: TextStyle(fontSize: 30,color: Theme.of(context).primaryColor),
                  ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _saveBill() {
    if (_titlecontroller.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Bills>(context, listen: false).addBill(
        _titlecontroller.text, _pickedImage, numbers[numbers.length-1] ,DateTime.now());
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Add Bill "),
      ),
      drawer: MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: "Name of Bill"),
                        controller: _titlecontroller,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ImageInput(_selectimage),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton.icon(icon: Icon(Icons.list),
                          color: Theme.of(context).accentColor,
                          label:  Text(
                            "Capture Bill ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: readText),
                    ],
                  )),
            ),
          ),
          RaisedButton.icon(
            color: Theme.of(context).accentColor,
            onPressed: _saveBill,
            icon: Icon(Icons.add),
            label: Text("Add to List"),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    ));
  }
}

import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _titlecontroller = new TextEditingController();
  File _pickedImage;
  String bill = " ";

  void _selectimage(File pickedimage) {
    _pickedImage = pickedimage;
  }

  void _saveBill() {
    if (_titlecontroller.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<Bills>(context, listen: false)
        .addBill(_titlecontroller.text, _pickedImage, double.parse(bill));
    Navigator.of(context).pop();
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
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("The Text is \n "+bill)
        ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(
        title: Text("Add Bill "),
      ),
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
                        height: 10,
                      ),
                      ImageInput(_selectimage), SizedBox(height: 20,),
                      RaisedButton(
                          child: Text("Capture Bill "), onPressed: readText),


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

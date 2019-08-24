import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onselectimage;

  ImageInput(this.onselectimage);

  @override
  State<StatefulWidget> createState() {
    return _ImageInput();
  }
}

class _ImageInput extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePictureC() async {
    final _imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    if (_imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = _imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(_imageFile.path);
    final savedImage = await _imageFile.copy('${appDir.path}/$filename');
    widget.onselectimage(savedImage);
  }

  Future<void> _takePictureG() async {
    final _imageFile =
    await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    if (_imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = _imageFile;
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(_imageFile.path);
    final savedImage = await _imageFile.copy('${appDir.path}/$filename');
    widget.onselectimage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No image Chosen",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 20),
                ),
          alignment: Alignment.center,
        ),
        FlatButton.icon(
            onPressed: _takePictureC,
            icon: Icon(Icons.camera),
            label: Text(
              "Take Picture",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16,fontWeight: FontWeight.bold),
            )),
        FlatButton.icon(
            onPressed: _takePictureG,
            icon: Icon(Icons.attach_file),
            label: Text(
              "Choose From gallery",
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

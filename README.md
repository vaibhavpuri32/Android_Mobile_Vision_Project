# project

A new Flutter application.

## Getting Started

This project is a  Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference. 

## About the App 

This is a App which Scans the Bill , or you can pick a photo from the gallery, 
it can detect the amount on the bill, and stores them in the local memory. 

## Working 

There are 2 steps involved in the working of the app :
1. Scanning the image/selecting it from gallery 
2. reading the amount, and storing the amount in the device. 

## languages Used 
Dart 


## Third Party packages used: 
  provider: ^3.0.0+1
  image_picker: ^0.6.1+3
  path_provider: ^1.2.0
  path: ^1.6.2
  firebase_ml_vision: ^0.9.2
  intl: ^0.15.8
  sqflite: ^1.1.6+3 
  To Know more about These packages: 
  - provider: https://pub.dev/packages/provider  
  -  image_picker: https://pub.dev/flutter/packages?q=image+picker
  - path_provider: https://pub.dev/packages/path_provider 
  - path: https://pub.dev/packages/path 
  - firebase_ml_vision: https://pub.dev/packages/firebase_ml_vision
  - intl: https://pub.dev/packages/intl/versions/0.15.1
  - sqflite: https://pub.dev/packages/sqflite
  
  
  ##  Working 
  
   The app uses device Camer ato capture iamges or it can simply pick
   images from gallery, then all the Text(including the numbers), are converted into a 
    List<String> using the ml_kit from firebase , then using the Regexp, we only flilter in the
    numeric value (RegExp(r"-?(?:\d*\.)?\d+(?:[eE][+-]?\d+)?")), then assuming the bill to the the last numeric 
    alue on the bill, we can store it in adatabase, which works on SQL , which is imp[lemented with thw help of 
    sqflite package offered by flutter. 
    
   ## Other useful Links 
     
    The Official flutter documentation: https://flutter.dev 
    The Official dart Library: https://dart.dev/articles/libraries/dart-io  
    A  video about  setting firebase for project : https://www.youtube.com/watch?v=13-jNF984C0
     
     

     
  





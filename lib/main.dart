import 'package:flutter/material.dart';
import 'package:flutter_ocr_firebase/ui/home.dart';

Future<void> main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Araç Tespit ve Plaka Tanıma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

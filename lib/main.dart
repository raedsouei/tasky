import 'package:flutter/material.dart';
import 'splash.dart';
import 'firstpage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: // FirstPage(),
          Splash(),
    );
  }
}

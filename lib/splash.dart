import 'firstpage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        'assets/TaskySplash.gif',
        fit: BoxFit.cover,
      ),
    );
    ;
  }
}

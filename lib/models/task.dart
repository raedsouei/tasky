import 'package:flutter/material.dart';

//import '';
class Task {
  final String name;
  bool isDone;
  List<String> lstName;
  List<bool> lstIsDone;

  Task({this.name, this.isDone = false});

  bool toggleDone() {
    isDone = !isDone;
    //final player = AudioCache()
    return isDone;
  }
}

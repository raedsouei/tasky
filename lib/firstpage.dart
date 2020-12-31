/***
 * 0 ==> false
 * 1 ==> true
 ***/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/tasklist.dart';
import 'widgets/ui.dart';
import 'Add_Task_Screan.dart';
import 'widgets/animation.dart';
import 'models/task.dart';

List<String> text = [];
List<String> boolean = [];

class FirstPage extends StatelessWidget {
  const FirstPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return My_Homme();
  }
}

class My_Homme extends StatefulWidget {
  @override
  _My_HommeState createState() => _My_HommeState();
}

class _My_HommeState extends State<My_Homme> {
  List<Task> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      if (sharedPreferences.getStringList('text') != null &&
          sharedPreferences.getStringList('text').isNotEmpty) {
        text = sharedPreferences.getStringList('text');
      } else {
        text = null;
      }

      if (sharedPreferences.getStringList("boolean") != null &&
          sharedPreferences.getStringList("boolean").isNotEmpty) {
        boolean = sharedPreferences.get('boolean');
      } else {
        boolean = null;
      }

      if (text != null && boolean != null) {
        for (int i = 0; i < text.length; i++) {
          //tasks[i].name = text[i];
          boolean[i] == '0' ? tasks[i].isDone = false : tasks[i].isDone = true;
        }
      }
    });
  }

  _saveData(text, boolean) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("text", text);
    sharedPreferences.setStringList("boolean", boolean);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.deepPurple[600],
          child: Icon(Icons.clear_all),
          onPressed: () {
            setState(() {
              tasks.clear();
              /* text.clear();
              boolean.clear();
              _saveData(text, boolean);*/
            });
            /*for (var i = 0; i < tasks.length; i++) {
              if (tasks[i].isDone == false) {
                
              }
            }*/
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        /*appBar: AppBar(
          backgroundColor: Colors.amber,
        ),*/
        backgroundColor: Colors.deepPurple[600],
        body: Stack(
          //alignment: Alignment.Center,
          children: [
            MyImage(), //Image background

            TodoText(tasks.length),

            DraggableScrollableSheet(
              expand: true,
              initialChildSize: 0.7,
              maxChildSize: 0.85,
              minChildSize: 0.1,
              builder:
                  (BuildContext context, ScrollController scrolController) {
                return FadeAnimation(
                  1,
                  Stack(
                    overflow: Overflow.visible, //visibelity of flo Act But

                    children: <Widget>[
                      Container(
                        decoration: myBox(
                          40,
                          40,
                          0,
                          0,
                          Colors.white,
                        ),
                        //color: Colors.white,
                        child: tasks.length == 0
                            ? Container(
                                //color: Colors.blue,
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                                decoration: myBox(40, 40, 0, 0, Colors.white),
                                child: Text(
                                  "No Task Found",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.grey),
                                ),
                              )
                            : TaskView(tasks), //tod's list tasklist
                      ),

                      //Floating action button
                      Positioned(
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    AddTaskScreen((newTaskTitle) {
                                      newTaskTitle == ""
                                          ? newTaskTitle = null
                                          : setState(() {
                                              //text.add(
                                              // newTaskTitle); //shared text
                                              // boolean.add("0"); //shared boolean
                                              tasks.add(Task(
                                                  name:
                                                      newTaskTitle)); //add new task
                                              Navigator.of(context)
                                                  .pop(); //pop the add bax
                                              _saveData(text, boolean);
                                            });
                                      print(text);
                                      print(boolean);
                                    }));
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        top: -30,
                        right: 50,
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }
}

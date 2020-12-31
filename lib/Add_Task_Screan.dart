import 'package:flutter/material.dart';
import 'widgets/ui.dart';

class AddTaskScreen extends StatefulWidget {
  //TextEditingController _newTask = new TextEditingController();

  AddTaskScreen(this.addTaskCallback);
  Function addTaskCallback;

  @override
  _AddTaskScreenState createState() =>
      _AddTaskScreenState(this.addTaskCallback);
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  _AddTaskScreenState(this.addTaskCallback);
  Function addTaskCallback;

  String newTaskTitle = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        height: MediaQuery.of(context).size.height,
        //width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20),
        decoration: myBox(
          20,
          20,
          0,
          0,
          Colors.white,
        ),

        child: Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple[600],
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,

                //controller: _newTask,
                onChanged: (String newText) {
                  // print(_newTask.toString());

                  newTaskTitle = newText; //_newTask.toString();
                  //print(newTaskTitle);
                },

                //enableInteractiveSelection: true,*/
                /*controller: _newTask,
                onSubmitted: (value) {
                  print(value);
                },
                onChanged: (value) {
                  newTaskTitle = value;
                  //print(newTaskTitle);
                },*/
              ),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple[50],
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.deepPurple[600],
                onPressed: () {
                  addTaskCallback(newTaskTitle);
                  //print(newTaskTitle);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

//void addTaskCallback(String newTaskTitle) {}

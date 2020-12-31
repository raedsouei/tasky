import 'package:flutter/material.dart';
import 'tasktail.dart';
import '../models/task.dart';
import 'package:audioplayers/audioplayers.dart';
import '../firstpage.dart';

class TaskView extends StatefulWidget {
  final List<Task> tasks;
  TaskView(this.tasks);

  @override
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  //AudioPlayer audioPlayer = AudioPlayer();
  /*play() async {
    int result = await audioPlayer.play('assets/sound2.wav');
    if (result == 1) {
      // success
    }*/
  //}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTail(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            CheckboxCallBack: (bool isCheckedState) {
              AudioPlayer.logEnabled = true;

              // ignore: unnecessary_statements
             // isCheckedState ? play() : null; //check sound
              setState(() {
                widget.tasks[index].toggleDone();
                /* widget.tasks[index].isDone
                    ? boolean[index] == "1"
                    : boolean[index] == "0";
                print(index);*/
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}

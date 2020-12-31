import 'package:flutter/material.dart';

class TaskTail extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function CheckboxCallBack;

  TaskTail({this.isChecked, this.taskTitle, this.CheckboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "$taskTitle",
        style: TextStyle(
          fontWeight: isChecked
              ? null
              : FontWeight.bold, //FontWeight.bold if is not checked
          decoration: isChecked
              ? TextDecoration.lineThrough
              : null, //Line bar if is checked
          color: isChecked ? Colors.grey : null, //color if is checked
          fontSize: isChecked ? 21 : 22, //font size if is checked
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.greenAccent,
        value: isChecked,
        onChanged: CheckboxCallBack,
      ),
      //MyCheckBox(isChecked, checkCallBack),
    );
  }
}

/*class MyCheckBox extends StatelessWidget {
  final bool isCheckedState;
  final Function toggleCheckBoxState;

  MyCheckBox(this.isCheckedState, this.toggleCheckBoxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.greenAccent,
      value: isCheckedState,
      onChanged: toggleCheckBoxState,
    );
  }
}*/

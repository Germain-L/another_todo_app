import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../provider/firestore.dart';
import 'task_text.dart';
import 'task_time.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  TaskCard({Key key, this.task}) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    final firestore = Provider.of<FirestoreHelper>(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskText(
                  text: widget.task.task,
                  strikethrough: widget.task.isDone,
                ),
                TaskTime(time: widget.task.date),
              ],
            ),
            Switch(
              value: widget.task.isDone,
              onChanged: (bool newValue) {
                print(newValue);
                setState(() {
                  firestore.updateTask(newValue, widget.task.id);
                });
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void newTaskDialog(BuildContext context, Function addTask) async {
  TextEditingController taskTextController = TextEditingController();
  await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Task',
                  hintText: 'eg. Finish making the app',
                ),
                controller: taskTextController,
                onSubmitted: (String text) {
                  addTask(taskTextController.text);
                  Navigator.pop(context);
                  // FocusScope.of(context).unfocus();
                },
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('ADD'),
            onPressed: () {
              addTask(taskTextController.text);
              Navigator.pop(context);
            },
          )
        ],
      );
    },
  );
}

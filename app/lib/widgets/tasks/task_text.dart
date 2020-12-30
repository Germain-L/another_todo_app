import 'package:flutter/material.dart';

class TaskText extends StatelessWidget {
  final String text;
  final bool strikethrough;

  const TaskText({Key key, this.text, this.strikethrough}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        decoration: strikethrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }
}

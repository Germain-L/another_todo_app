import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskTime extends StatelessWidget {
  final Timestamp time;

  const TaskTime({Key key, this.time}) : super(key: key);

  String formatTime() {
    DateTime timeDate = time.toDate();
    String year = timeDate.year.toString();
    String month = timeDate.month.toString();
    String day = timeDate.day.toString();
    String hour = timeDate.hour.toString();
    String minute = timeDate.minute.toString();

    return "$day-$month-$year at $hour:$minute";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(),
      style: TextStyle(
        fontSize: 12,
      ),
    );
  }
}

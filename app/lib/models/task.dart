import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Task {
  final String task;
  final Timestamp date;
  final String id;

  bool isDone;

  Task({
    this.task,
    @required this.date,
    @required this.isDone,
    @required this.id,
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../provider/firestore.dart';
import '../widgets/buttons/animated_fab.dart';
import '../widgets/dialogs/settings.dart';
import '../widgets/tasks/task_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final firestore = Provider.of<FirestoreHelper>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: AnimatedFab(),
      appBar: AppBar(
        title: Text("TODO"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) => SettingsSheet(),
              );
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: firestore.getTasksStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> docs = querySnapshot.docs;

            if (docs.length <= 0) {
              return Center(child: Text("No tasks added yet"));
            }

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(docs[index].id),
                  onDismissed: (DismissDirection dismissDirection) {
                    firestore.deleteTask(docs[index].id);
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("${docs[index].data()["text"]} dismissed"),
                    ));
                  },
                  background: Container(color: Colors.redAccent[400]),
                  child: TaskCard(
                    task: Task(
                      task: docs[index].data()["text"],
                      date: docs[index].data()["date"],
                      id: docs[index].id,
                      isDone: docs[index].data()["isDone"],
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

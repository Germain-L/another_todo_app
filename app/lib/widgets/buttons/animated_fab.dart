import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/firestore.dart';
import '../tasks/new_task.dart';

class AnimatedFab extends StatefulWidget {
  @override
  _AnimatedFabState createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );
  }

  void animate() {
    if (_controller.isAnimating) {
      // do nothing
      return null;
    } else if (_controller.isCompleted) {
      _controller.reset();
      _controller.forward();
    } else if (_controller.isDismissed) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    Function addTaskFirestore = Provider.of<FirestoreHelper>(context).addTask;
    return AnimatedBuilder(
      animation: _controller,
      child: GestureDetector(
        onLongPress: () {
          animate();
        },
        child: FloatingActionButton(
          onPressed: () {
            newTaskDialog(context, addTaskFirestore);
            animate();
          },
          child: Icon(Icons.add),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        final animation = Tween<double>(
          begin: 1,
          end: 0,
        ).animate(_controller);
        return Transform.rotate(
          angle: pi * animation.value,
          child: child,
        );
      },
    );
  }
}

// Information about one task

import "package:flutter/material.dart";
import "package:todo_list/data/task.dart";

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.name)),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.asset("assets/check_list.png", height: 100),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  // Task name
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("Name:"),
                          Text(task.name),
                        ],
                      ),
                    ),
                  ),

                  // Task description (separate row?)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text("Description:"),
                          Text(task.description),
                        ],
                      ),
                    ),
                  ),

                  // 3 rows to follow
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page to create a new task

import "package:flutter/material.dart";
import "package:todo_list/data/task.dart";
import "package:todo_list/screens/home_screen.dart";

// Stateful widget for the entry of new tasks
class CreateTaskScreen extends StatefulWidget {
  // Constructor
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  // Current values of fields entered on form
  String name = ""; // or String? to make optionally null
  String description = "";
  bool done = false;

  // Definition of the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Create Task")),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        decoration: const InputDecoration(labelText: "Name"),
                        onChanged: (value) {
                          name = value;
                        }),
                    TextFormField(
                        decoration:
                            const InputDecoration(labelText: "Description"),
                        onChanged: (value) {
                          description = value;
                        }),
                    CheckboxListTile(
                        title: const Text("Done:"),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 16),
                        value: done,
                        onChanged: (bool? value) {
                          if (value != null) {
                            setState(() {
                              done = value;
                            });
                          }
                        }),
                    ElevatedButton(
                        onPressed: () {
                          if (name.isNotEmpty) {
                            // TO DO: use validators
                            final task = Task(name, description, done);
                            final tl = FakeTaskList();
                            tl.addTask(task);
                            //debugPrint(task.name);
                            //Navigator.pushNamed(context, "/home");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const HomeScreen()));
                          }
                        },
                        child: const Text("Save")),
                  ],
                ),
              )),
        ));
  }
}

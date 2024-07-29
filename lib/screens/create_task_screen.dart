import "package:flutter/material.dart";

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  bool currentDone = false;
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
                        decoration: InputDecoration(labelText: "Name"),
                        onChanged: (value) {
                          print(value);
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Description")),
                    CheckboxListTile(
                        title: const Text("Done:"),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 16),
                        value: currentDone,
                        onChanged: (bool? value) {
                          if (value != null) {
                            print(value);
                            setState(() {
                              currentDone = value;
                            });
                          }
                        }),
                    ElevatedButton(
                        onPressed: () {
                          print("Saving");
                        },
                        child: const Text("Save")),
                  ],
                ),
              )),
        ));
  }
}

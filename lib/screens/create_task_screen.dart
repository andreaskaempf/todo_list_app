import "package:flutter/material.dart";

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

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
                  ],
                ),
              )),
        ));
  }
}

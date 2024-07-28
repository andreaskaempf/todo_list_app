import 'package:flutter/material.dart';
import 'package:todo_list/data/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskList = FakeTaskList();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = taskList.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset("assets/check_list.png"),
          ),
          title: const Text("Home Screen")),
      body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              width: 30,
              color: Colors.yellow,
              child: Text(tasks[index].name),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

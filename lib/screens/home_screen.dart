import 'package:flutter/material.dart';
import 'package:todo_list/data/task.dart';
import 'package:todo_list/screens/task_detail_screen.dart';

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
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.apple),
              title: Text(tasks[index].name),
              subtitle: Text(tasks[index].description),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => TaskDetailScreen(task: tasks[index])));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/create");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

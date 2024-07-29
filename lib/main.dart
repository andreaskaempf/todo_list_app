import 'package:flutter/material.dart';
import 'package:todo_list/screens/create_task_screen.dart';
import 'package:todo_list/screens/splash_screen.dart';
//import 'screens/task_detail_screen.dart';
import 'screens/home_screen.dart';
//import 'data/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //const  t = Task("Test",  "A test task");
    //final tlist = FakeTaskList();
    //final t = tlist.getFirstTask();
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
        "/create": (context) => const CreateTaskScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: TaskDetailScreen(task: t),
      //home: const CreateTaskScreen(), // should this really be const?
    );
  }
}

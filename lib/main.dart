import 'package:flutter/material.dart';
//import 'package:todo_list/screens/create_task_screen.dart';
import 'package:todo_list/screens/splash_screen.dart';
//import 'package:todo_list/screens/task_detail_screen.dart';
//import 'screens/task_detail_screen.dart';
//import 'screens/home_screen.dart';
//import 'data/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SplashScreen(),
    );
  }
}

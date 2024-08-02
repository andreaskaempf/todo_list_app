// Top level app interface: calls splash screen, which transitions to
// home page (task list)

import 'package:flutter/material.dart';
import 'package:todo_list/screens/splash_screen.dart';

// Start the app
void main() {
  runApp(const MyApp());
}

// Top level widget for the app, starts with splash screen
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

import "package:flutter/material.dart";
import "dart:async";
import "package:todo_list/screens/home_screen.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use timer to transition from splash screen to task list after 3 secs
    Timer(const Duration(seconds: 1), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });

    // Show the splash screen, just an image
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/check_list.png"),
        ),
      ),
    );
  }
}

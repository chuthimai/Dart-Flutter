import 'package:flutter/material.dart';
import 'package:quiz/models/start_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StartScreen(),
        ),
        backgroundColor: const Color.fromARGB(229, 232, 111, 194),
      ),
    );
  }

  const MyApp({super.key});
}
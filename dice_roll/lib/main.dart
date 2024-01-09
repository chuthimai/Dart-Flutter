
import 'package:first_app/main_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MainApp(const [
        Color.fromARGB(229, 229, 163, 212),
        Color.fromARGB(142, 252, 248, 248),
        Color.fromARGB(216, 8, 203, 238),
      ]),
    ),
  ));
}


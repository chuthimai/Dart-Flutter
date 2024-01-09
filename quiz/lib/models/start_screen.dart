import 'package:flutter/material.dart';

const logoFulutter = "assets/images/quiz-logo.png";

class StartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          logoFulutter,
          width: 300,
        ),
        const SizedBox(height: 20,),
        const Text(
          "Learn Flutter the fun way!",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30,),
        ElevatedButton(
          onPressed: (){},
          child: const Text("Start Quiz"),
        )
      ],
    );
  }

  const StartScreen({super.key});
}
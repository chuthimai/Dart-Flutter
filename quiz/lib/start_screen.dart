import 'package:flutter/material.dart';
import 'package:quiz/styled.dart';

const logoFulutter = "assets/images/quiz-logo.png";

class StartScreen extends StatelessWidget {
  final void Function() startQuiz;
  const StartScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          logoFulutter,
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Styled(text: "Learn Flutter the fun way!", size: 20),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(250, 255, 255, 255),
          ),
          icon: const Icon(Icons.arrow_right_alt_outlined),
          label: const Text("Start Quiz"),
        )
      ],
    );
  }
}

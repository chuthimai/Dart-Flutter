import 'package:flutter/material.dart';
import 'package:quiz/styled.dart';

class QuestionIndex extends StatelessWidget {
  final String text;
  final bool isCorrect;

  const QuestionIndex({super.key, required this.text, required this.isCorrect});

  Color backgroundColor() {
    if (isCorrect) return Colors.lightBlue;
    return const Color.fromARGB(255, 236, 119, 159);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: CircleAvatar(
          backgroundColor: backgroundColor(),
          child: Styled(
            text: text,
            color: Colors.black,
          ),
        ));
  }
}

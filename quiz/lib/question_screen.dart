import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_question.dart';
import 'package:quiz/styled.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Styled(
              text: currentQuestion.text,
              size: 22,
              fontWeight: FontWeight.w800,
              color: const Color.fromARGB(230, 255, 255, 255),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((e) => AnswerButton(
                  answerText: e,
                  onTap: () {
                    answerQuestion(e); // ấn vào câu trả lời nào thì thêm câu trả lời đó vào List
                  },
                )),
          ]),
    );
  }
}
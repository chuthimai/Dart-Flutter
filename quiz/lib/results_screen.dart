import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/questions_summary.dart';
import 'package:quiz/styled.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswer;
  final void Function() restart;

  const ResultsScreen({
    super.key,
    required this.chosenAnswer,
    required this.restart,
  });

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestions = chosenAnswer.length;
    final numCorrectQuestions = summaryData
        .where(
            (element) => (element['correct_answer'] == element['user_answer']))
        .length;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Styled(
            text: "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
            size: 20,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: summaryData),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            child: OutlinedButton.icon(
              onPressed: restart,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: const Color.fromARGB(250, 255, 255, 255),
              ),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text("Restart Quiz"),
            ),
          )
        ],
      ),
    );
  }
}

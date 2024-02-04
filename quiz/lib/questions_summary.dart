import 'package:flutter/material.dart';
import 'package:quiz/question_index.dart';
import 'package:quiz/styled.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map((e) => Container(
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        QuestionIndex(
                          text: ((e['question_index'] as int) + 1).toString(),
                          isCorrect: e['correct_answer'] == e['user_answer'],
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Styled(
                                text: e['question'] as String,
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Styled(
                                text: e['correct_answer'] as String,
                                size: 13,
                                fontWeight: FontWeight.normal,
                                color: const Color.fromARGB(247, 96, 94, 94),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Styled(
                                text: e['user_answer'] as String,
                                size: 13,
                                fontWeight: FontWeight.normal,
                                color: const Color.fromARGB(255, 8, 120, 215),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

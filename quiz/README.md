# quiz

Choose answers and has a result page to summary

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Struct

- model contain basic class: 
  - quiz_question.dart -> struct of question include: answers(List) and question(String)
- data:
  - questions.dart -> all questions and answers
- answer_button.dart -> button form
- styled.dart -> text form
- start_screen.dart
- question_screen.dart
- results_screen.dart
- quiz.dart -> control to transform between pages: StartScreen => QuestionsScreen => ResultsScreen
- questions_summary.dart -> form of a result question
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_dart/screens/quiz_app/data/questions.dart';
import 'package:flutter_dart/screens/quiz_app/question_screen.dart';
import 'package:flutter_dart/screens/quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.onRestart,
    required this.chosenAnsers,
  }) : super(key: key);

  final void Function() onRestart;
  final List<String> chosenAnsers;
  
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chosenAnsers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answers': chosenAnsers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answers'];
    }).length;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 108, 51, 207),
              Color.fromARGB(255, 69, 20, 153),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $numCorrectAnswers out out $numTotalQuestions question correctly!'),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(summaryData: summaryData),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart,
                label: const Text('Reset Quiz'),
                icon: Icon(Icons.refresh),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QuestionIdentifer extends StatelessWidget {
  const QuestionIdentifer({
    Key? key,
    required this.questionIndex,
    required this.isCorrectAnswer,
  }) : super(key: key);
  final int questionIndex;
  final bool isCorrectAnswer;
  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

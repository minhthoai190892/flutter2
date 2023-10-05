// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dart/screens/quiz_app/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({
    Key? key,
    required this.itemData,
  }) : super(key: key);
  final Map<String, Object> itemData;
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answers'] == itemData['correct_answer'];
    return Row(
      children: [
        QuestionIdentifer(
            questionIndex: itemData['question_index'] as int,
            isCorrectAnswer: isCorrectAnswer),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(itemData['user_answers'] as String),
              Text(itemData['correct_answer'] as String),
            ],
          ),
        ),
      ],
    );
  }
}

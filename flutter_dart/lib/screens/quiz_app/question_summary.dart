// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dart/screens/quiz_app/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    Key? key,
    required this.summaryData,
  }) : super(key: key);
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}

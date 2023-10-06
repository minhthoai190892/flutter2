// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dart/screens/quiz_app/data/questions.dart';

import 'package:flutter_dart/screens/quiz_app/question_screen.dart';
import 'package:flutter_dart/screens/quiz_app/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //tạo mảng mới để chứa kết quả
  List<String> selectedAnswers = [];
  void restarQuiz() { 
    setState(() {
      selectedAnswers = [];
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(onSelectAnswer: chooseAnswers),
          ));
    });
  }

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                  chosenAnsers: selectedAnswers, onRestart: restarQuiz),
            ));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < selectedAnswers.length; i++) {
      print(selectedAnswers[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: const Color.fromARGB(255, 92, 7, 107),
      ),
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/images/quiz-logo.png'),
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.arrow_right_alt),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(width: 0.0)),
                onPressed: () {
                  //chuyển đến trang QuestionScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        onSelectAnswer: chooseAnswers,
                      ),
                    ),
                  );
                },
                label: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

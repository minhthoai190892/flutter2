import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: const Color.fromARGB(255, 92, 7, 107),
      ),
      backgroundColor: const Color.fromARGB(255, 92, 7, 107),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/quiz-logo.png'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 73, 5, 85),
            ),
            onPressed: () {},
            child:
                const Text('Start Quiz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

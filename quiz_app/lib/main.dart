import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizPage(title: 'Quiz App'),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.title});
  final String title;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  List<Question> questionBank = [
    Question(
        questionText:
            'Anh/chị hãy xác định nội dung nào sau đây không thuộc lĩnh vực phát triển thẩm mỹ cho trẻ mẫu giáo?',
        questionAnswer: true),
    Question(
        questionText:
            'Anh/chị hãy xác định nội dung giáo dục nào sau đây không thuộc lĩnh vực phát triển thẩm mỹ cho trẻ nhà trẻ 24 – 36 tháng tuổi',
        questionAnswer: true),
  ];
  //theo dõi vị trí của câu hỏi
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    questionBank[questionNumber].questionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    bool correctAnswer =
                        questionBank[questionNumber].questionAnswer;
                    if (correctAnswer == true) {
                      print('user got it right');
                    } else {
                      print('user got it wrong');
                    }
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    });
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    bool correctAnswer =
                        questionBank[questionNumber].questionAnswer;
                    if (correctAnswer == false) {
                      print('user got it right');
                    } else {
                      print('user got it wrong');
                    }
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(
                        const Icon(
                          Icons.check,
                          color: Colors.red,
                        ),
                      );
                    });
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // ignore: todo
            //TODO: add a Row here as your score keeper
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}

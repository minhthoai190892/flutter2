import 'package:flutter_dart/screens/quiz_app/model/quiz_question.dart';

final questions = [
  QuizQuestion(
      text: 'What are the main building blocks of Flutter UIs?',
      answers: [
        'Widgets',//1
        'Components',
        'Blocks',
        'Functions',
        'Bloc',
      ]),
  QuizQuestion(text: 'How are Flutter UIs built?', answers: [
    'By combining widgets in code',//2
    'By combining widgets in a visual editor',
    'By defining widgets in config files',
    'By using XCode for iOS and Android Studio for Android',
  ]),
  QuizQuestion(
    text: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',//3
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    text:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',//4
    ],
  ),
  QuizQuestion(
    text: 'What happens if you change data in a StatelessWidget?',
    answers: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',//5
    ],
  ),
  QuizQuestion(
    text: 'How should you update data inside of StatefulWidgets?',
    answers: [
      'By calling setState()',//6
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

import 'package:quiz_app/question.dart';

class QuizBrain {
  //theo dõi vị trí của câu hỏi
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
        questionText:
            'Anh/chị hãy xác định nội dung nào sau đây không thuộc lĩnh vực phát triển thẩm mỹ cho trẻ mẫu giáo?',
        questionAnswer: true),
    Question(
        questionText:
            'Anh/chị hãy xác định nội dung giáo dục nào sau đây không thuộc lĩnh vực phát triển thẩm mỹ cho trẻ nhà trẻ 24 – 36 tháng tuổi',
        questionAnswer: true),
    Question(
        questionText:
            'Anh/chị hãy xác định nội dung giáo dục nào sau đây không thuộc lĩnh vực phát triển thẩm mỹ cho trẻ nhà trẻ 24 – 36 tháng tuổi',
        questionAnswer: true),
  ];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }
    void reset() {
    _questionNumber = 0;
  }
}

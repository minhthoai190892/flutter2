// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuizQuestion {
  final String text;
  final List<String> answers;
  QuizQuestion({
    required this.text,
    required this.answers,
  });
  List<String> getShuffledAnswer() {
    //tạo một mảng mới với mảng đã có
    final shuffledAnswer = List.of(answers);
    // bắt đầu xáo trộn
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }
}

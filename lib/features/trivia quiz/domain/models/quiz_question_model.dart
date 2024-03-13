class QuizQuestionModel {
  String? question;
  List<dynamic>? options;
  String? correctAnswer;

  QuizQuestionModel(this.question, this.options, this.correctAnswer);

  QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'] ?? '';
    options = json['options'] ?? [];
    correctAnswer = json['correctAnswer'] ?? '';
  }
}

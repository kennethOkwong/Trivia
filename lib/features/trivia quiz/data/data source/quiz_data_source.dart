import '../../domain/models/quiz_question_model.dart';

abstract class QuizDataSource {
  Future<List<QuizQuestionModel>> getTriviaQuestions();
}

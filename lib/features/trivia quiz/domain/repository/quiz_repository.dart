import '../models/quiz_question_model.dart';

abstract class QuizRepository {
  Future<List<QuizQuestionModel>> getTriviaQuestions();
}

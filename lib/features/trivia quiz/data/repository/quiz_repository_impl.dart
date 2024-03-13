import '../../domain/models/quiz_question_model.dart';
import '../../domain/repository/quiz_repository.dart';
import '../data source/quiz_data_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizDataSource quizDataSource;

  QuizRepositoryImpl(this.quizDataSource);

  @override
  Future<List<QuizQuestionModel>> getTriviaQuestions() async {
    return await quizDataSource.getTriviaQuestions();
  }
}

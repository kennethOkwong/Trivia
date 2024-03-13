import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../trivia quiz/domain/repository/quiz_repository.dart';

final getIt = GetIt.I;

class BaseViewModel extends ChangeNotifier {
  String errorMessage = '';
  String loadingText = '';
  bool isLoading = false;
  QuizRepository quizRepository = getIt<QuizRepository>();

  void setErrorMessage(String error) {
    errorMessage = error;
    notifyListeners();
  }

  void clearErrorMessage() {
    errorMessage = '';
    notifyListeners();
  }

  void setLoadingText(String text) {
    loadingText = text;
    notifyListeners();
  }

  void clearLoadingText() {
    loadingText = '';
    notifyListeners();
  }

  void startLoader(String? text) {
    if (!isLoading) {
      isLoading = true;
      setLoadingText(text ?? '');
      notifyListeners();
    }
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      clearLoadingText();
      notifyListeners();
    }
  }
}

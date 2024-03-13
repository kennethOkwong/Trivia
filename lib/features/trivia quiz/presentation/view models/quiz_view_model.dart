import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:trivia/core/navigation/app_routes.dart';
import 'package:trivia/core/utils/snack_message.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/quiz_question_model.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/result_summary_model.dart';

import '../../../base/base_vm.dart';

class QuizViewModel extends BaseViewModel {
  List<QuizQuestionModel> questions = [];
  QuizQuestionModel currentQuestion = QuizQuestionModel('', [], '');
  int currentQuestionindex = 0;
  int correctAnsers = 0;
  int timeSpent = 0;
  double questionTimer = 0;

  void setCurrentquestion(QuizQuestionModel question) {
    currentQuestion = question;
    notifyListeners();
  }

  void incrementQuestionIndex() {
    currentQuestionindex++;
    notifyListeners();
  }

  void handleTimer() {}

  Timer startTimer(BuildContext context) {
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      if (questionTimer < 10) {
        questionTimer++;
        timeSpent++;
        notifyListeners();
      } else {
        questionTimer = 0;
        timer.cancel();
        answerQuestion(context, false);
      }
    });
  }

  void answerQuestion(BuildContext context, bool isCorrect) async {
    questionTimer = -2;
    // startTimer(context);
    startLoader('');
    if (isCorrect) {
      correctAnsers++;
    }
    await Future.delayed(const Duration(seconds: 2));
    stopLoader();
    if (questionTimer == -2 && context.mounted) {
      startTimer(context);
    }
    if (currentQuestionindex < questions.length - 1) {
      incrementQuestionIndex();
      setCurrentquestion(questions[currentQuestionindex]);
    } else {
      final percentage = (correctAnsers / questions.length) * 100;
      final summary = ResultSummary(
        correctAnsers,
        questions.length - correctAnsers,
        timeSpent,
        percentage > 50,
      );
      if (context.mounted) {
        context.go(AppRoutes.result, extra: summary);
      }
    }
  }
}

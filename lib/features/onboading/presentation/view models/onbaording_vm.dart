import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia/core/navigation/app_routes.dart';

import '../../../base/base_vm.dart';

class OnboardingVM extends BaseViewModel {
  Future<void> getQuestions(BuildContext context) async {
    // try {
    startLoader('Fetching Questions...');
    final questions = await quizRepository.getTriviaQuestions();

    if (context.mounted) {
      context.go(AppRoutes.quiz, extra: questions);
    }

    stopLoader();
    // } catch (error) {
    //   stopLoader();
    //   log(error.toString());
    // }
  }
}

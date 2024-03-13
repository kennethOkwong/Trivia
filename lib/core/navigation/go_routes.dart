import 'package:go_router/go_router.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/quiz_question_model.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/result_summary_model.dart';
import 'package:trivia/features/trivia%20quiz/presentation/views/quiz_screen.dart';
import 'package:trivia/features/trivia%20quiz/presentation/views/result_screen.dart';

import '../../features/onboading/presentation/views/landing_screen.dart';
import '../../features/onboading/presentation/views/page_404.dart';
import '../../features/onboading/presentation/views/splash_screen.dart';
import 'app_routes.dart';

final goRouter = GoRouter(
  errorBuilder: (context, state) => const Page404(),
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.landing,
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: AppRoutes.quiz,
      builder: (context, state) =>
          QuizScreen(questions: state.extra as List<QuizQuestionModel>),
    ),
    GoRoute(
      path: AppRoutes.result,
      builder: (context, state) =>
          ResultScreen(result: state.extra as ResultSummary),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:trivia/core/navigation/app_routes.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/result_summary_model.dart';
import 'package:trivia/features/trivia%20quiz/presentation/widgets/result_summary_conatainer.dart';

import '../../../../core/app theme/app_colors.dart';
import '../../../../core/utils/app_buttons.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widget_helpers.dart';
import '../../../base/base_ui.dart';
import '../view models/quiz_view_model.dart';
import '../widgets/result_message_container.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final ResultSummary result;

  @override
  Widget build(BuildContext context) {
    final width = getDeviceWidth(context);
    final height = getDeviceHeight(context);
    return BaseView<QuizViewModel>(
      onModelReady: (model) async {},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                padding: EdgeInsets.only(
                  top: width * 0.05,
                  left: width * 0.05,
                  right: width * 0.05,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.background),
                  ),
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Results',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                        spaceV(width * 0.03),
                        ResultSummaryContainer(
                          timeSpent: DateFormat.ms().format(
                              DateTime(0, 1, 1, 0, 0, result.timeSpent)),
                          correct: result.correctAnswers,
                          inCorrect: result.incorrectAnswers,
                        ),
                        spaceV(width * 0.05),
                        ResultMessageContainer(
                          width: width,
                          won: result.won,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: width * 0.10,
                left: width * 0.05,
                right: width * 0.05,
                child: MainAppButton(
                    label: 'Go Home',
                    onTap: () {
                      context.go(AppRoutes.landing);
                    }),
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trivia/features/trivia%20quiz/domain/models/quiz_question_model.dart';

import '../../../../core/app theme/app_colors.dart';
import '../../../../core/utils/app_buttons.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widget_helpers.dart';
import '../../../base/base_ui.dart';
import '../view models/quiz_view_model.dart';
import '../widgets/question_box_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.questions});

  final List<QuizQuestionModel> questions;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    final width = getDeviceWidth(context);
    final height = getDeviceHeight(context);
    return BaseView<QuizViewModel>(
      onModelReady: (model) async {
        model.questions = widget.questions;
        if (widget.questions.isNotEmpty) {
          model.setCurrentquestion(widget.questions[0]);
          model.startTimer(context);
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.clock,
                            color: Colors.white,
                          ),
                          spaceH(5),
                          Text(
                            DateFormat.ms().format(
                                DateTime(0, 1, 1, 0, 0, model.timeSpent)),
                            // model.timeSpent.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Stack(
                              children: [
                                CircularProgressIndicator(
                                  color: AppColors.lightGreen,
                                  value: model.questionTimer / 10,
                                  backgroundColor: Colors.white,
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        model.questionTimer < 0
                                            ? '0'
                                            : model.questionTimer
                                                .round()
                                                .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  spaceV(width * 0.06),
                  QuestionBoxWidget(
                    width: width,
                    questionNumber: model.currentQuestionindex + 1,
                    question: model.currentQuestion.question ?? '',
                  ),
                  spaceV(width * 0.10),
                  Text(
                    'Choose Correct Option',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  spaceV(width * 0.04),
                  Expanded(
                    child: ListView.builder(
                      itemCount: model.currentQuestion.options!.length,
                      itemBuilder: (context, index) {
                        return OptionButton(
                          optionIndex: index,
                          optionText: model.currentQuestion.options![index],
                          correctAnswer:
                              model.currentQuestion.correctAnswer ?? '',
                          onOptionTapped: (isCorrect) async {
                            model.answerQuestion(context, isCorrect);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

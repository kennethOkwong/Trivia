import 'package:flutter/material.dart';

import '../../../../core/app theme/app_colors.dart';
import '../../../../core/utils/widget_helpers.dart';

class QuestionBoxWidget extends StatelessWidget {
  const QuestionBoxWidget({
    super.key,
    required this.width,
    required this.questionNumber,
    required this.question,
  });

  final double width;
  final int questionNumber;
  final String question;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.08),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.skyBlue, width: 5),
      ),
      child: Column(
        children: [
          Text(
            'Question $questionNumber',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          spaceV(width * 0.05),
          Text(
            question,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

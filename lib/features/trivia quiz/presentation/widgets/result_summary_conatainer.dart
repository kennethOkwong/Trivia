import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app theme/app_colors.dart';
import '../../../../core/utils/widget_helpers.dart';

class ResultSummaryContainer extends StatelessWidget {
  const ResultSummaryContainer({
    super.key,
    required this.timeSpent,
    required this.correct,
    required this.inCorrect,
  });

  final String timeSpent;
  final int correct;
  final int inCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.skyBlue, width: 3),
      ),
      child: Column(
        children: [
          Text('Total Time Used: $timeSpent'),
          spaceV(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '$correct Correct',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  spaceH(5),
                  const Icon(
                    Icons.check_circle,
                    color: AppColors.green,
                    size: 15,
                  ),
                ],
              ),
              spaceH(10),
              const Text('|'),
              spaceH(10),
              Row(
                children: [
                  Text(
                    '$inCorrect incorrect',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  spaceH(5),
                  const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: AppColors.red,
                    size: 15,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/app theme/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widget_helpers.dart';

class ResultMessageContainer extends StatelessWidget {
  const ResultMessageContainer({
    super.key,
    required this.width,
    required this.won,
  });

  final double width;
  final bool won;

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
          Image.asset(
            won ? AppImages.success : AppImages.fail,
            width: width * 0.20,
          ),
          Text(
            'Better luck next time',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          spaceV(width * 0.05),
          Text(
            won ? 'Congratulations, You Won' : "Sorry you Didn't win",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

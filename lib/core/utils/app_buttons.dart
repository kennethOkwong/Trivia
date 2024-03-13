import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/core/app%20theme/app_colors.dart';

class MainAppButton extends StatelessWidget {
  const MainAppButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 0,
                  color: AppColors.yellow,
                  blurRadius: 0,
                  blurStyle: BlurStyle.solid,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: SizedBox(
              height: 50,
              child: FilledButton(
                onPressed: () {
                  onTap();
                },
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.skyBlue,
                  foregroundColor: Colors.black,
                ),
                child: Text(label),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class OptionButton extends StatefulWidget {
  const OptionButton({
    super.key,
    required this.optionIndex,
    required this.onOptionTapped,
    required this.optionText,
    required this.correctAnswer,
  });

  final int optionIndex;
  final String optionText;
  final String correctAnswer;
  final Function(bool isCorrect) onOptionTapped;

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  bool? correctOption;
  @override
  Widget build(BuildContext context) {
    final optionsMap = {
      0: 'A.',
      1: 'B.',
      2: 'C.',
      3: 'D.',
      4: 'E.',
      5: 'F.',
      6: 'G.'
    };
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: correctOption == null
              ? Colors.white
              : correctOption == true
                  ? AppColors.green
                  : AppColors.red,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: correctOption == null
                  ? Colors.white
                  : correctOption == true
                      ? AppColors.lightGreen
                      : AppColors.lightRed,
              width: 3),
        ),
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: EdgeInsets.all(correctOption == null ? 15 : 20),
          child: Row(
            children: [
              Text(
                '${optionsMap[widget.optionIndex]}    ',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: correctOption == null ? Colors.black : Colors.white),
              ),
              Expanded(
                child: Text(
                  widget.optionText,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color:
                          correctOption == null ? Colors.black : Colors.white),
                ),
              ),
              Visibility(
                visible: correctOption == true,
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.lightGreen,
                ),
              ),
              Visibility(
                visible: correctOption == false,
                child: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: AppColors.lightRed,
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () async {
        setState(() {
          widget.onOptionTapped(widget.optionText == widget.correctAnswer);
          correctOption = widget.optionText == widget.correctAnswer;
        });

        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          correctOption = null;
        });
      },
    );
  }
}

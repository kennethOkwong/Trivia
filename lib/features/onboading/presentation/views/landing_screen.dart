import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia/core/app%20theme/app_colors.dart';
import 'package:trivia/core/utils/app_images.dart';
import 'package:trivia/core/utils/app_strings.dart';
import 'package:trivia/core/utils/widget_helpers.dart';
import 'package:trivia/features/base/base_ui.dart';

import '../../../../core/utils/app_buttons.dart';
import '../view models/onbaording_vm.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = getDeviceWidth(context);
    final height = getDeviceHeight(context);
    return BaseView<OnboardingVM>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: AppColors.blue,
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.background),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: width * 0.05,
                right: width * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.playTrivia,
                      style: GoogleFonts.dmSans(
                          color: AppColors.skyBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.08),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: width * 0.15,
                left: width * 0.05,
                right: width * 0.05,
                child: MainAppButton(
                  label: AppStrings.startNow,
                  onTap: () {
                    model.getQuestions(context);
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

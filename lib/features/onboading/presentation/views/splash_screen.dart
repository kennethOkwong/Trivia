import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/app_routes.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/widget_helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetIt getIt = GetIt.I;

  _splash() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    if (mounted) {
      //go to dashboard if all above fails
      context.go(AppRoutes.landing);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = getDeviceWidth(context);
    _splash();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppImages.appLogo,
            width: width * 0.3,
            height: width * 0.3,
          ),
        ),
      ),
    );
  }
}

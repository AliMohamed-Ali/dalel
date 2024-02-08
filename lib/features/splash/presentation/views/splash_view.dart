import 'dart:async';

import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/features/on_boarding/presentation/views/function/onboarding_visited.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisited = onBoardingVisited();
    if (isOnBoardingVisited) {
      (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? delayedNavigation(context, "/bottomNavBar")
          : delayedNavigation(context, "/login");
    } else {
      delayedNavigation(context, "/onBoarding");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStylies.pacifico400Style64,
        ),
      ),
    );
  }
}

void delayedNavigation(BuildContext context, String path) {
  Future.delayed(const Duration(milliseconds: 2000), () {
    customReplacementNavigation(context, path);
  });
}

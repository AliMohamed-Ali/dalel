import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/on_boarding/presentation/views/function/onboarding_visited.dart';
import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons(
      {super.key, required this.currentIndex, required this.pageController});
  final int currentIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return currentIndex == 2
        ? Column(
            children: [
              CustomButton(
                  text: AppStrings.createAccount,
                  onPressed: () {
                    onBoardingVisited();
                    customReplacementNavigation(context, "/signUp");
                  }),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                   onBoardingVisited();
                    customReplacementNavigation(context, "/login");
                  },
                  child: const Text(
                    AppStrings.loginNow,
                    style: AppTextStylies.poppins400Style16,
                  )),
            ],
          )
        : CustomButton(
            text: AppStrings.next,
            onPressed: () {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceInOut);
            });
  }
}

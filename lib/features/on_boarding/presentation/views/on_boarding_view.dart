import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              CustomNavBar(
                onTap: () {
                  customReplacementNavigation(context, "/login");
                },
              ),
              const SizedBox(height: 32),
              OnBoardingWidgetBody(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                pageController: pageController,
              ),
              const SizedBox(height: 88),
              GetButtons(
                  currentIndex: currentIndex, pageController: pageController),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

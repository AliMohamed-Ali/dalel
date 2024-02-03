import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Expanded(
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          itemCount: 3,
          itemBuilder: (context, index) => Column(
            children: [
              Container(
                width: 343,
                height: 290,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesOnBoarding),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomIndicator(controller: pageController),
              const SizedBox(height: 32),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Explore The history with Dalel in a smart way",
                  style: AppTextStylies.poppins500Style24,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Using our app’s history libraries you can find many historical periods ",
                style: AppTextStylies.poppins500Style24.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

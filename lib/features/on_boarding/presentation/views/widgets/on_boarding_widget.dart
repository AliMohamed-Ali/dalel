import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/features/on_boarding/data/model/on_boarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/views/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody(
      {super.key, required this.pageController, this.onPageChanged});
  final PageController pageController;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              width: 343,
              height: 290,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onBoardingList[index].imagePath),
                ),
              ),
            ),
            const SizedBox(height: 24),
            CustomIndicator(controller: pageController),
            const SizedBox(height: 32),
            Text(
              onBoardingList[index].title,
              style: AppTextStylies.poppins500Style24,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                onBoardingList[index].subTitle,
                style: AppTextStylies.poppins500Style24
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

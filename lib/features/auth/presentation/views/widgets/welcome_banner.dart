import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomBanner extends StatelessWidget {
  const WelcomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            AppStrings.appName,
            style: AppTextStylies.pacifico700Style32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesVector1),
              SvgPicture.asset(Assets.imagesVector2),
            ],
          ),
        ],
      ),
    );
  }
}

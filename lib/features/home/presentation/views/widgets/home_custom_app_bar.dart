import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewCustomNavBar extends StatelessWidget {
  const HomeViewCustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(Assets.imagesMenu),
            Text(
              AppStrings.appName,
              style: AppTextStylies.pacifico400Style64.copyWith(fontSize: 22),
            )
          ],
        ),
      ],
    );
  }
}

import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget(
      {super.key, required this.text1, required this.text2, this.onTap});
  final String text1, text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: RichText(
          text: TextSpan(children: [
            TextSpan(text: text1, style: AppTextStylies.poppins400Style12),
            TextSpan(
                onEnter: (event) {},
                text: text2,
                style: AppTextStylies.poppins400Style12
                    .copyWith(color: AppColors.lightGrey)),
          ]),
        ),
      ),
    );
  }
}

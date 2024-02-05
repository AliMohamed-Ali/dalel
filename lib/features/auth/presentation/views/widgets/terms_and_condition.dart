import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: AppStrings.iHaveAgreeToOur,
              style: AppTextStylies.poppins400Style12),
          TextSpan(
              text: AppStrings.termsAndCondition,
              style: AppTextStylies.poppins400Style12
                  .copyWith(decoration: TextDecoration.underline)),
        ]))
      ],
    );
  }
}
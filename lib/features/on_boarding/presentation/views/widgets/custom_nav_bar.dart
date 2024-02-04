import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key, this.onTap,
  });
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          AppStrings.skip,
          style: AppTextStylies.poppins500Style24.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class CustomHeadTitle extends StatelessWidget {
  const CustomHeadTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStylies.poppins400Style20,
    );
  }
}
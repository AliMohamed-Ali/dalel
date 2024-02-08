import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key, required this.text, required this.imagePath});
  final String text;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 94,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              // spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 7),
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          height: 48,
          width: 63,
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStylies.poppins500Style18
                .copyWith(fontSize: 16, color: AppColors.deepBrown),
          ),
        ),
        Container(
          width: 47,
          height: 64,
          decoration:  BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath))),
        )
      ]),
    );
  }
}

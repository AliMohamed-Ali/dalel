import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersItem extends StatelessWidget {
  const HistoricalCharactersItem({super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 133,
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
      child: Column(
        children: [
          Container(
            width: 74,
            height: 96,
            decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath))),
          ),
          const SizedBox(height: 11),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppTextStylies.poppins500Style18
                .copyWith(fontSize: 14, color: AppColors.deepBrown),
          ),
        ],
      ),
    );
  }
}

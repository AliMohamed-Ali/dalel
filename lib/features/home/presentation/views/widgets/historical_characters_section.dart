import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_characters_item.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => const HistoricalCharactersItem(
          title: "Lionheart",
          imagePath: Assets.imagesFrame3,
        ),
        itemCount: 6,
      ),
    );
  }
}

import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_periods_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        HistoricalPeriodItem(
          text: "Ancient Egypt",
          imagePath: Assets.imagesFrame,
        ),
        HistoricalPeriodItem(
          text: "Islamic Era",
          imagePath: Assets.imagesFrame,
        ),
      ],
    );
  }
}

import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_head_text.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_option_view.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_periods_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsSection extends StatelessWidget {
  const HistoricalPeriodsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        CustomHeadTitle(text: AppStrings.historicalPeriods),
        SizedBox(height: 16),
        CustomOptionView(
          options: [
            CustomOptionItem(
              text: "Ancient Egypt",
              imagePath: Assets.imagesFrame,
            ),
            CustomOptionItem(
              text: "Islamic Era",
              imagePath: Assets.imagesFrame2,
            ),
          ],
        ),
      ],
    );
  }
}

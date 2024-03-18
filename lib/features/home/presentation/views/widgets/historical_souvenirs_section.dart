import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_head_text.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listOfCharacter = [
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeadTitle(text: AppStrings.historicalSouvenirs),
        const SizedBox(height: 16),
        CustomListView(listOfCharacter: listOfCharacter),
      ],
    );
  }
}

import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_head_text.dart';

class HistoricalCharacterSection extends StatelessWidget {
  const HistoricalCharacterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listOfCharacter = [
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
      {"title": "Lionheart", "imagePath": Assets.imagesFrame3},
    ];
    return Column(
      children: [
        const SizedBox(height: 32),
        const Align(
            alignment: Alignment.centerLeft,
            child: CustomHeadTitle(text: AppStrings.historicalCharacters)),
        const SizedBox(height: 16),
        CustomListView(listOfCharacter: listOfCharacter),
        const SizedBox(height: 32)
      ],
    );
  }
}

import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/core/widgets/custom_head_text.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_list_view.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_character_section.dart';
import 'package:dalel/features/home/presentation/views/widgets/custom_option_item.dart';
import 'package:dalel/features/home/presentation/views/widgets/historical_souvenirs_section.dart';
import 'package:dalel/features/home/presentation/views/widgets/home_custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(child: HomeViewCustomNavBar()),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharacterSection()),
            SliverToBoxAdapter(child: HistoricalSouvenirsSection()),
          ]),
        ),
      ),
    );
  }
}

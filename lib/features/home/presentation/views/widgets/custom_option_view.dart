import 'package:dalel/features/home/presentation/views/widgets/historical_periods_item.dart';
import 'package:flutter/material.dart';

class CustomOptionView extends StatelessWidget {
  const CustomOptionView({super.key, required this.options});
  final List<CustomOptionItem> options;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, children: options);
  }
}

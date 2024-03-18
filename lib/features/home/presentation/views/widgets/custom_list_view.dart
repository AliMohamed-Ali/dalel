import 'package:dalel/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.listOfCharacter});
  final List<Map<String, dynamic>> listOfCharacter;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => ListViewItem(
          title: listOfCharacter[index]["title"],
          imagePath: listOfCharacter[index]["imagePath"],
        ),
        itemCount: listOfCharacter.length,
      ),
    );
  }
}

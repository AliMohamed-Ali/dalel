import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.label, this.isPassword});
  final String label;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 8, left: 8),
      child: TextField(
        decoration: InputDecoration(
          suffixIcon: isPassword != null ? const Icon(Icons.visibility) : null,
          label: Text(
            label,
            style: AppTextStylies.poppins500Style18,
          ),
          focusedBorder: getOutlineBorder(),
          enabledBorder: getOutlineBorder(),
        ),
      ),
    );
  }
}

OutlineInputBorder getOutlineBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey),
    borderRadius: BorderRadius.circular(4),
  );
}

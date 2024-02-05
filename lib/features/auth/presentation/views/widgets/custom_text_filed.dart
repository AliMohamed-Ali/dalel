import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.label, this.isPassword, this.onChanged, this.onFieldSubmitted});
  final String label;
  final bool? isPassword;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 8, left: 8),
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted ,
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

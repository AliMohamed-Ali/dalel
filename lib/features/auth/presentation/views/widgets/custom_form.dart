import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:dalel/features/auth/presentation/views/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          child: Column(children: [
            CustomTextFormField(
              label: AppStrings.fristName,
              onChanged: (firstName) =>
                  BlocProvider.of<AuthCubit>(context).firstName = firstName,
            ),
            CustomTextFormField(
                label: AppStrings.lastName,
                onChanged: (lastName) =>
                    BlocProvider.of<AuthCubit>(context).lastName = lastName),
            CustomTextFormField(
                label: AppStrings.emailAddress,
                onChanged: (emailAddress) => BlocProvider.of<AuthCubit>(context)
                    .emailAddress = emailAddress),
            CustomTextFormField(
                label: AppStrings.password,
                isPassword: true,
                onChanged: (password) =>
                    BlocProvider.of<AuthCubit>(context).password = password),
            const TermsAndCondition(),
            const SizedBox(height: 88),
            CustomButton(onPressed: () {
              BlocProvider.of<AuthCubit>(context).signUpWithEmailAndPassword();
            }, text: AppStrings.signUp),
          ]),
        );
      },
    );
  }
}

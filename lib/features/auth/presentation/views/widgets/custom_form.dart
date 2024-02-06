import 'package:dalel/core/function/custom_toast.dart';
import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
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
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailureState) {
          showToast(state.errorMessage);
        }
        if (state is SignUpSuccessState) {
          showToast("SignUp Successfuly");
          customReplacementNavigation(context, "/home");
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.signUpKey,
          child: Column(children: [
            CustomTextFormField(
              label: AppStrings.fristName,
              onChanged: (firstName) => authCubit.firstName = firstName,
            ),
            CustomTextFormField(
                label: AppStrings.lastName,
                onChanged: (lastName) => authCubit.lastName = lastName),
            CustomTextFormField(
                label: AppStrings.emailAddress,
                onChanged: (emailAddress) =>
                    authCubit.emailAddress = emailAddress),
            CustomTextFormField(
                isObscureText: !authCubit.isShowPassword,
                suffixIcon: IconButton(
                  icon: Icon(authCubit.isShowPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => authCubit.showPassoword(),
                ),
                label: AppStrings.password,
                isPassword: true,
                onChanged: (password) => authCubit.password = password),
            const TermsAndCondition(),
            const SizedBox(height: 88),
            state is SignUpLoadingState
                ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                : CustomButton(
                    onPressed: authCubit.termsAndCondition
                        ? () {
                            if (authCubit.signUpKey.currentState!.validate()) {
                              authCubit.signUpWithEmailAndPassword();
                            }
                          }
                        : null,
                    text: AppStrings.signUp),
          ]),
        );
      },
    );
  }
}

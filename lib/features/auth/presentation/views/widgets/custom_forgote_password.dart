import 'package:dalel/core/function/custom_toast.dart';
import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast("Check Your Email");
          customReplacementNavigation(context, "/login");
        } else if (state is ResetPasswordFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.forgotPasswordKey,
          child: Column(
            children: [
              CustomTextFormField(
                label: AppStrings.emailAddress,
                onChanged: (emailAddress) =>
                    authCubit.emailAddress = emailAddress,
              ),
              const SizedBox(height: 129),
              state is ResetPasswordLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: AppStrings.sendResetPasswordLink,
                      onPressed: ()async {
                        if (authCubit.forgotPasswordKey.currentState!
                            .validate()) {
                        await  authCubit.resetPasswordWithLink();
                        }
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}

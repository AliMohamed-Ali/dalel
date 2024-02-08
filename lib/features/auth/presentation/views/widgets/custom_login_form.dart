import 'package:dalel/core/function/custom_toast.dart';
import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:dalel/features/auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showToast("Welcome Back!!");
          customReplacementNavigation(context, '/home');
        } else if (state is LoginFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: authCubit.logInKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                CustomTextFormField(
                  label: AppStrings.emailAddress,
                  onChanged: (emailAddress) =>
                      authCubit.emailAddress = emailAddress,
                ),
                CustomTextFormField(
                  label: AppStrings.password,
                  isPassword: true,
                  isObscureText: !authCubit.isShowPassword,
                  suffixIcon: IconButton(
                    icon: Icon(authCubit.isShowPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () => authCubit.showPassoword(),
                  ),
                  onChanged: (password) => authCubit.password = password,
                ),
                const SizedBox(height: 16),
                const ForgetPasswordWidget(),
                const SizedBox(height: 102),
                state is LoginLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        text: AppStrings.signIn,
                        onPressed: () {
                          if (authCubit.logInKey.currentState!.validate()) {
                            authCubit.loginWithEmailAddressAndPassword();
                          }
                        },
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}

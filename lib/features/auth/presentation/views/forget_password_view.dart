import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_stylies.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_forgote_password.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
          const SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.forgotPasswordPage)),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          SliverToBoxAdapter(
              child: Image.asset(Assets.imagesForgotPassword, height: 235)),
          const SliverToBoxAdapter(child: SizedBox(height: 14)),
          SliverToBoxAdapter(
              child: Text(
            "Enter your registered email below to receive password reset instruction",
            style: AppTextStylies.poppins400Style16.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          )),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverToBoxAdapter(
            child: CustomForgotPasswordForm(),
          )
        ],
      ),
    ));
  }
}

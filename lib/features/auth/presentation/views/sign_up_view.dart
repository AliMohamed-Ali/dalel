import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_text_filed.dart';
import 'package:dalel/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:dalel/features/auth/presentation/views/widgets/terms_and_condition.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 108)),
            const SliverToBoxAdapter(child: WelcomeText()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomTextField(label: AppStrings.fristName)),
            const SliverToBoxAdapter(
                child: CustomTextField(label: AppStrings.lastName)),
            const SliverToBoxAdapter(
                child: CustomTextField(label: AppStrings.emailAddress)),
            const SliverToBoxAdapter(
                child: CustomTextField(
                    label: AppStrings.password, isPassword: true)),
            const SliverToBoxAdapter(child: TermsAndCondition()),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
            SliverToBoxAdapter(
              child: CustomButton(onPressed: () {}, text: AppStrings.signUp),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: HaveAccountWidget(
              text1: AppStrings.alreadyHaveAnAccount,
              text2: AppStrings.signIn,
            ))
          ],
        ),
      ),
    );
  }
}

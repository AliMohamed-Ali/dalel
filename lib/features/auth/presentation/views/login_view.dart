import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_login_form.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_banner.dart';
import 'package:dalel/features/auth/presentation/views/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomBanner(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcomeBack),
          ),
          const SliverToBoxAdapter(
            child: CustomLoginForm(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () => customReplacementNavigation(context, '/signUp'),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}

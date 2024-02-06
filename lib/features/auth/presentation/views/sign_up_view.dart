import 'package:dalel/core/function/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/views/widgets/custom_form.dart';
import 'package:dalel/features/auth/presentation/views/widgets/have_account_widget.dart';
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
            const SliverToBoxAdapter(child: CustomForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HaveAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
                onTap: () => customNavigation(context, '/login'),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}

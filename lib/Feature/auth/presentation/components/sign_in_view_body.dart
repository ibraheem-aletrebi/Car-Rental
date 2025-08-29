import 'package:car_rental/Feature/auth/presentation/components/auth_header_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/auth_redirect_text.dart';
import 'package:car_rental/Feature/auth/presentation/components/or_divider.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_in_form_section.dart';
import 'package:car_rental/Feature/auth/presentation/components/sign_in_social_button.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthHeaderSection(
                  title: 'Welcome Back\nReady to hit the road.',
                ),
                HeightSpace(height: 40),
                SignInFormSection(),
                HeightSpace(height: 25),
                OrDivider(),
                HeightSpace(height: 25),
                SignInSocialButton(),
                HeightSpace(height: 10),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AuthRedirectText(
                message: 'Don\'t have an account?',
                actionText: ' Sign Up.',
                onTap: () {
                  Navigator.pushNamed(context, Routes.kSignUpView);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
